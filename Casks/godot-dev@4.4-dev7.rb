cask "godot-dev@4.4-dev7" do
  version "4.4-dev7"
  sha256 "facb5a8349bba1019ceb01d3cb94c058c99a7390b4d4af436161fd0f168a2c03"

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-dev7/Godot_v4.4-dev7_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.4-dev7)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.4-dev7)"
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
