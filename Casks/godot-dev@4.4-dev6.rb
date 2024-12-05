cask "godot-dev@4.4-dev6" do
  version "4.4-dev6"
  sha256 "ff53e900f6e801e89c586042e582fce516da3d3e1a3988eae64e7f84ab8eba69"

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-dev6/Godot_v4.4-dev6_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Build 4.4-dev6)"
  desc "Free and open source 2D and 3D game engine (godot-builds release4.4-dev6)"
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
