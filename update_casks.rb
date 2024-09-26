require 'json'
require 'open-uri'
require 'fileutils'
require 'net/http'
require 'uri'

def fetch_latest_versions
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
      releases = JSON.parse(response.body)
      releases.select { |r| r['prerelease'] && r['tag_name'] =~ /^\d+\.\d+-dev\d+$/ }
              .sort_by { |r| r['published_at'] }
              .reverse
              .take(5)
              .map { |r| r['tag_name'] }
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
      puts "Failed to fetch latest versions after 3 attempts. Error: #{e.message}"
      []
    end
  end
end


def update_cask(version)
  cask_content = <<~RUBY
    cask "godot-dev@#{version}" do
      version "#{version}"
      sha256 :no_check

      url "https://github.com/godotengine/godot-builds/releases/download/#{version}/Godot_v#{version}_macos.universal.zip",
          verified: "github.com/godotengine/godot-builds/"
      name "Godot Engine (Development Build #{version})"
      desc "Free and open source 2D and 3D game engine (Development Build #{version})"
      homepage "https://godotengine.org/"

      livecheck do
        skip "This is a versioned cask"
      end

      auto_updates true

      app "Godot.app", target: "Godot (#{version}).app"

      zap trash: [
        "~/Library/Application Support/Godot",
        "~/Library/Caches/Godot",
        "~/Library/Saved Application State/org.godotengine.godot.savedState",
      ]
    end
  RUBY

  write_cask_file("godot-dev@#{version}", cask_content)
end

def update_latest_cask(version)
  cask_content = <<~RUBY
    cask "godot-dev" do
      version "#{version}"
      sha256 :no_check

      url "https://github.com/godotengine/godot-builds/releases/download/#{version}/Godot_v#{version}_macos.universal.zip",
          verified: "github.com/godotengine/godot-builds/"
      name "Godot Engine (Latest Development Build)"
      desc "Free and open source 2D and 3D game engine (Latest Development Build)"
      homepage "https://godotengine.org/"

      livecheck do
        url "https://github.com/godotengine/godot-builds/releases"
        strategy :github_latest
        regex(/^(\d+\.\d+-dev\d+)$/)
      end

      auto_updates true

      app "Godot.app", target: "Godot (#{version}).app"

      zap trash: [
        "~/Library/Application Support/Godot",
        "~/Library/Caches/Godot",
        "~/Library/Saved Application State/org.godotengine.godot.savedState",
      ]
    end
  RUBY

  write_cask_file("godot-dev", cask_content)
end

def write_cask_file(name, content)
  FileUtils.mkdir_p('Casks')
  File.write("Casks/#{name}.rb", content)
end

versions = fetch_latest_versions
if versions.empty?
  puts "No versions found or unable to fetch versions. Exiting."
  exit 0
end

versions.each do |version|
  update_cask(version)
end
update_latest_cask(versions.first)

system('git', 'config', 'user.name', 'github-actions')
system('git', 'config', 'user.email', 'github-actions@github.com')
system('git', 'add', 'Casks/*.rb')
system('git', 'commit', '-m', 'Update Godot development versions') if `git status --porcelain`.strip.length > 0
