cask "vimma" do
  version "0.1.6"
  sha256 "2c3118874f68e362049e0d4206b745324339f11a7355fc8198115c3b23a94bd2"

  url "https://github.com/vimma-browser/vimma/releases/download/v#{version}/vimma-#{version}-macos-aarch64.dmg"
  name "Vimma"
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
