cask "godot-dev@4.3-rc1" do
  version "4.3-rc1"
  sha512 "acd9db7b2c0819eb33cdee36516721e2a474772b8d50da9b2617bd912dbaa124cf8d4e6a92fb34232c62908dc5d58a77b302ddcfb53dafd7587a55f8eec69cd0"

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
