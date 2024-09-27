cask "godot-dev@4.3-rc1" do
  version "4.3-rc1"
  sha256 "31af6a9d4e4816b156f40378a1a94cb16a3b5884fc72385c18a1d9a989bfeb82"

  url "https://github.com/godotengine/godot-builds/releases/download/4.3-rc1/Godot_v4.3-rc1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.3-rc1)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.3-rc1)"
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
