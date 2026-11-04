cask "vimma" do
  version "0.1.15"
  sha256 "0d86cc35ced33acc1a8f11e3dc1448339d061bcb9d25e03ef680ff3397b19ec4"

  url "https://github.com/vimma-browser/vimma/releases/download/v#{version}/vimma-#{version}-macos-aarch64.dmg"
  name "Vimma"
  desc "Keyboard-first web browser built on Firefox"
  homepage "https://github.com/vimma-browser/vimma"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Vimma.app"
  binary "#{appdir}/Vimma.app/Contents/MacOS/vimma"
  binary "#{appdir}/Vimma.app/Contents/MacOS/vimma-ctl"

  uninstall quit: "dev.vimma.browser"

  zap trash: [
    "~/Library/Application Support/Vimma",
    "~/Library/Caches/Vimma",
    "~/Library/Preferences/dev.vimma.browser.plist",
    "~/Library/Saved Application State/dev.vimma.browser.savedState",
  ]
end
