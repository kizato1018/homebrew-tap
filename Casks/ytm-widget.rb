cask "ytm-widget" do
  version "1.0.4"

  if Hardware::CPU.intel?
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_x64.dmg"
    sha256 "dead2676bd9909c25653fb94cc6f533cf2320a6b1beab1895b1f212661d8311c"
  else
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_aarch64.dmg"
    sha256 "6adf0430ce2792b12e8c0bdacbd1b9b0026d67cbaf590c04b7ed7816f11328c4"
  end

  name "YTM Widget"
  desc "YouTube Music tray widget with ad-blocking and track download"
  homepage "https://github.com/kizato1018/ytm-widget"

  app "ytm-widget.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ytm-widget.app"]
  end

  uninstall quit: "com.kizato.ytm-widget"

  zap trash: [
    "~/Library/Application Support/com.kizato.ytm-widget",
    "~/Library/Caches/com.kizato.ytm-widget",
    "~/Library/Logs/ytm-widget",
    "~/Library/Preferences/com.kizato.ytm-widget.plist"
  ]
end
