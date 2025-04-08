cask "godot-dev@4.5-dev2" do
  version "4.5-dev2"
  sha256 "fdad0c7729e8a1ede8b1f1c9ae96305ae5886512d17d6c73a9a3bb3425b8fb29"

  url "https://github.com/godotengine/godot-builds/releases/download/4.5-dev2/Godot_v4.5-dev2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.5-dev2)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.5-dev2)"
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
