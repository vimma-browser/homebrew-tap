cask "vimma" do
  version "0.1.20"
  sha256 "ab63290d55bc08008a57e2cef3cdcaf39a0cfda8eb61bd22260bf59fa0d23699"

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
