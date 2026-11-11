cask "vimma" do
  version "0.1.18"
  sha256 "ddaf07a8075a3538deeba6bbc562478638d2fc754a21ac8dfe9bb7c37868ac12"

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
