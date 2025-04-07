cask "godot-dev@4.4-rc3" do
  version "4.4-rc3"
  sha256 "d476397e2018e9682433dd37ac2399cfffa07d8eb50fe8858e936e4b7f8f09bc"

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-rc3/Godot_v4.4-rc3_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.4-rc3)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.4-rc3)"
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
