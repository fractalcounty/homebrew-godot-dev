require 'json'
require 'open-uri'
require 'fileutils'
require 'net/http'
require 'uri'
require 'openssl'
require 'digest'

# Fetch releases from GitHub API
def fetch_releases
  url = 'https://api.github.com/repos/godotengine/godot-builds/releases'
  uri = URI(url)

  headers = {
    'Authorization' => "token #{ENV['GITHUB_TOKEN']}",
    'User-Agent' => 'Godot-Dev-Cask-Updater'
  }

  retries = 3
  begin
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.get(uri.request_uri, headers)
    end

    if response.code == '200'
      JSON.parse(response.body)
    else
      raise "GitHub API request failed with status code: #{response.code}"
    end
  rescue StandardError => e
    retries -= 1
    if retries > 0
      puts "Error: #{e.message}. Retrying in 5 seconds..."
      sleep 5
      retry
    else
      puts "Failed to fetch releases after 3 attempts. Error: #{e.message}"
      []
    end
  end
end

# Extract version tags that are prereleases and match the pattern
def extract_versions(releases)
  releases.select { |r| 
    r['prerelease'] && r['tag_name'] =~ /^\d+\.\d+-(dev|rc)\d+$/
  }
  .sort_by { |r| r['published_at'] }
  .reverse
  .take(5)
  .map { |r| r['tag_name'] }
end

# Compute sha256 checksum for a given asset URL
def compute_sha256(asset_url)
  begin
    uri = URI(asset_url)
    puts "Downloading asset to compute sha256: #{asset_url}"
    # Open the URI and read in binary mode
    asset_data = URI.open(uri, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE).read
    sha256 = Digest::SHA256.hexdigest(asset_data)
    puts "Computed sha256: #{sha256}"
    sha256
  rescue StandardError => e
    puts "Failed to download or compute sha256 for #{asset_url}: #{e.message}"
    nil
  end
end

# Generate the cask content with sha256 checksum
def generate_cask_content(version, sha256_checksum, latest = false)
  cask_name = latest ? "godot-dev" : "godot-dev@#{version}" 
  app_target = "Godot Dev.app"

  <<~RUBY
    cask "#{cask_name}" do
      version "#{version}"
      sha256 "#{sha256_checksum}"

      url "https://github.com/godotengine/godot-builds/releases/download/#{version}/Godot_v#{version}_macos.universal.zip",
          verified: "github.com/godotengine/godot-builds/"
      name "Godot Engine #{latest ? '(Latest)' : "(Build #{version})"}"
      desc "Free and open source 2D and 3D game engine #{latest ? '(Latest godot-builds release)' : "(godot-builds release#{version})"}"
      homepage "https://godotengine.org/"

      livecheck do
        #{latest ? 'url "https://github.com/godotengine/godot-builds/releases"' : 'skip "This is a versioned cask"'}
        #{latest ? 'strategy :github_latest' : ''}
        #{latest ? 'regex(/^(\d+\.\d+-(dev|rc)\d+)$/)' : ''}
      end

      auto_updates true
      conflicts_with cask: #{latest ? '"godot-dev@*"' : '"godot-dev"'}

      app "Godot.app", target: "#{app_target}"

      binary "\#{appdir}/#{app_target}/Contents/MacOS/Godot", target: "godot-dev"

      zap trash: [
        "~/Library/Application Support/Godot",
        "~/Library/Caches/Godot",
        "~/Library/Saved Application State/org.godotengine.godot.savedState",
      ]
    end
  RUBY
end

# Write the cask file if it has changed
def write_cask_file(name, content)
  FileUtils.mkdir_p('Casks')
  cask_path = "Casks/#{name}.rb"

  if File.exist?(cask_path)
    existing_content = File.read(cask_path)
    if existing_content == content
      puts "Cask #{name} is already up to date. No changes made."
      return
    else
      puts "Cask #{name} exists but has updates. Overwriting."
    end
  else
    puts "Creating new cask #{name}."
  end

  File.write(cask_path, content)
  puts "Cask #{name} has been updated."
end

# Update casks with the latest versions
def update_casks(versions)
  # versioned casks
  versions.each do |version|
    asset_name = "Godot_v#{version}_macos.universal.zip"
    asset_url = "https://github.com/godotengine/godot-builds/releases/download/#{version}/#{asset_name}"
    sha256_checksum = compute_sha256(asset_url)
    if sha256_checksum
      cask_content = generate_cask_content(version, sha256_checksum)
      write_cask_file("godot-dev@#{version}", cask_content)
    else
      puts "Skipping cask for #{version} due to missing sha256 checksum."
    end
  end

  # latest cask
  latest_version = versions.first
  asset_name = "Godot_v#{latest_version}_macos.universal.zip"
  asset_url = "https://github.com/godotengine/godot-builds/releases/download/#{latest_version}/#{asset_name}"
  sha256_checksum = compute_sha256(asset_url)
  if sha256_checksum
    latest_cask_content = generate_cask_content(latest_version, sha256_checksum, true)
    write_cask_file("godot-dev", latest_cask_content)
  else
    puts "Skipping latest cask update due to missing sha256 checksum for #{latest_version}."
  end
end

# Main execution
def main
  releases = fetch_releases
  versions = extract_versions(releases)
  
  if versions.empty?
    puts "No versions found or unable to fetch versions. Exiting."
    exit 0
  end
  
  update_casks(versions)
end

main
