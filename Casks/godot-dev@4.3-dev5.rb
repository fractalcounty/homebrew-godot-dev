cask "godot-dev@4.3-dev5" do
  version "4.3-dev5"
  sha256 :no_check

  url "https://github.com/godotengine/godot-builds/releases/download/4.3-dev5/Godot_v4.3-dev5_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Development Build 4.3-dev5)"
  desc "Free and open source 2D and 3D game engine (Development Build 4.3-dev5)"
  homepage "https://godotengine.org/"

  livecheck do
    skip "This is a versioned cask"
  end

  auto_updates true

  app "Godot.app", target: "Godot (4.3-dev5).app"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
