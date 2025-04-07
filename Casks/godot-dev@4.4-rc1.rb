cask "godot-dev@4.4-rc1" do
  version "4.4-rc1"
  sha256 "e8ee4f3e23fb8f94d8205b5b01d0c7c97ddf13b1f008c21532c594986ffb193c"

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-rc1/Godot_v4.4-rc1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.4-rc1)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.4-rc1)"
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
