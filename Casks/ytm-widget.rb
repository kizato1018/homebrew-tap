cask "ytm-widget" do
  version "1.0.3"

  if Hardware::CPU.intel?
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_x64.dmg"
    sha256 "2c5f32d734a16b0640930b584d1f1243045c76412664ccc0d6cd4fa5384b886b"
  else
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_aarch64.dmg"
    sha256 "f70ec1ea963e60fc0cf2ed8fac9cdc1955d274ff0490e93ea1ad0fc69b64c675"
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
