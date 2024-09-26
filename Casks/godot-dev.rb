cask "godot-dev" do
  version "4.4-dev2"
  sha256 :no_check

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-dev2/Godot_v4.4-dev2_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Latest Development Build)"
  desc "Free and open source 2D and 3D game engine (Latest Development Build)"
  homepage "https://godotengine.org/"

  livecheck do
    url "https://github.com/godotengine/godot-builds/releases"
    strategy :github_latest
    regex(/^(d+.d+-devd+)$/)
  end

  auto_updates true

  app "Godot.app", target: "Godot (4.4-dev2).app"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
