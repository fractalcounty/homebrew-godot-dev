cask "godot-dev@4.3-rc2" do
  version "4.3-rc2"
  sha512 "1411c5648d27590e70ca14ad92480d486ad6c2e745ed202c414535a17a01a423385c517acd63674c78c831e2e1173d22d4c54ea44fbec3c263a9e3f28cf0b018"

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
