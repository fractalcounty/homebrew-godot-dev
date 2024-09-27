cask "godot-dev@4.3-rc3" do
  version "4.3-rc3"
  sha256 "cf1f0b0d5fa50bc81f8f90cec98a1bc3089e1ae9f36b981649c5550368dc283d"

  url "https://github.com/godotengine/godot-builds/releases/download/4.3-rc3/Godot_v4.3-rc3_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.3-rc3)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.3-rc3)"
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
