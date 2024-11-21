cask "godot-dev" do
  version "4.4-dev5"
  sha256 "3bd6d55fa7f79051fe960a7408c33bb4db95d1ffac890b013c92014ae4513d29"

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-dev5/Godot_v4.4-dev5_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Latest)"
  desc "Free and open source 2D and 3D game engine (Latest godot-builds release)"
  homepage "https://godotengine.org/"

  livecheck do
    url "https://github.com/godotengine/godot-builds/releases"
    strategy :github_latest
    regex(/^(\d+\.\d+-(dev|rc)\d+)$/)
  end

  auto_updates true
  conflicts_with cask: "godot-dev@*"

  app "Godot.app", target: "Godot Dev.app"

  binary "#{appdir}/Godot Dev.app/Contents/MacOS/Godot", target: "godot-dev"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
