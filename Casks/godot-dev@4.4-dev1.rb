cask "godot-dev@4.4-dev1" do
  version "4.4-dev1"
  sha512 "322ce4fd5904e152217a96ed078449dce3e0a6053dc863f831bee2ff74881f5bdda314cb41efc38f0eda6a14a4823125d5cfc0b2ab6ba4779075d1911de62bf0"

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-dev1/Godot_v4.4-dev1_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.4-dev1)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.4-dev1)"
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
