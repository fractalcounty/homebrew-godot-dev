cask "godot-dev@4.3-rc2" do
  version "4.3-rc2"
  sha256 "2553d668460a15d779daa41f34c3bff66abfe64a908bc599bd067e776ea17c21"

  url "https://github.com/godotengine/godot-builds/releases/download/4.3-rc2/Godot_v4.3-rc2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.3-rc2)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.3-rc2)"
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
