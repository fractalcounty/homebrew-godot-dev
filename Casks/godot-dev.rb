cask "godot-dev" do
  version "4.5-dev4"
  sha256 "5fa94768f9cbccf14c726525e2961d22065937f723f64bf3548ba3986fb1ee8e"

  url "https://github.com/godotengine/godot-builds/releases/download/4.5-dev4/Godot_v4.5-dev4_macos.universal.zip",
      verified: "github.com/godotengine/godot-builds/"
  name "Godot Engine (Latest)"
  desc "Free and open source 2D and 3D game engine (Latest godot-builds release)"
  homepage "https://godotengine.org/"

  livecheck do
    url "https://github.com/godotengine/godot-builds/releases"
    strategy :github_latest
    regex(/^(\d+\.\d+-(dev|rc)\d+)$/)
  end

  auto_updates true
  conflicts_with cask: "godot-dev@*"

  app "Godot.app", target: "Godot Dev.app"

  binary "#{appdir}/Godot Dev.app/Contents/MacOS/Godot", target: "godot-dev"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
