cask "godot-dev@4.4-rc2" do
  version "4.4-rc2"
  sha256 "f2b96c9d458e801010fb6bc677d4c7f6af434b1cc747bbec1c997f9a04d1e7b7"

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-rc2/Godot_v4.4-rc2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.4-rc2)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.4-rc2)"
  homepage "https://godotengine.org/"

  livecheck do
    skip "This is a versioned cask"
    
    
  end

  auto_updates true
  conflicts_with cask: "godot-dev"

  app "Godot.app", target: "Godot Dev.app"

  binary "#{appdir}/Godot Dev.app/Contents/MacOS/Godot", target: "godot-dev"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
