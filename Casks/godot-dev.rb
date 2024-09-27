cask "godot-dev" do
  version "4.4-dev2"
  sha512 "7076c12d130bc6442ad9fee1035cef26e64a7eccafd0cd5787d705431460be7b956f1e391ae2762be269253b92a301675b6084802ba2e6099e84c753511b277d"

  url "https://github.com/godotengine/godot-builds/releases/download/4.4-dev2/Godot_v4.4-dev2_macos.universal.zip",
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
