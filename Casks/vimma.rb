cask "vimma" do
  version "0.1.7"
  sha256 "7875c1abf15d02c63144142dd0ab1c29c13e00a4ac6607d7c7186da6a1548ef6"

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

  uninstall quit: "dev.vimma.browser"

  zap trash: [
    "~/Library/Application Support/Vimma",
    "~/Library/Caches/Vimma",
    "~/Library/Preferences/dev.vimma.browser.plist",
    "~/Library/Saved Application State/dev.vimma.browser.savedState",
  ]

  caveats <<~EOS
    Vimma is not notarised by Apple yet, so macOS will not open it the first time.
    Open it once, then go to System Settings → Privacy & Security, choose
    Open Anyway next to Vimma, and confirm. macOS may ask again after an upgrade.
  EOS
end
