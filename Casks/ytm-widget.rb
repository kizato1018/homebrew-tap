cask "ytm-widget" do
  version "1.0.2"

  if Hardware::CPU.intel?
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_x64.dmg"
    sha256 "28789842764ed09965ec68259e88af07b4f27f81c41ef2750ff99cfcd7d42d8d"
  else
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_aarch64.dmg"
    sha256 "29278462568914b8eca48ca9525c7fc11a488959bb6f96e17f92f9604a1dab01"
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
