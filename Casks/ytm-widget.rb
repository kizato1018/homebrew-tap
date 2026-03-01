cask "ytm-widget" do
  version "1.0.2"

  if Hardware::CPU.intel?
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_x64.dmg"
    sha256 "d95abb2a72d064c2711e3084013e18eb00982be0ae112ec7d6ffd26897c0a122"
  else
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_aarch64.dmg"
    sha256 "7bd39170d5c8d06f81a0e8ba3895b9dddb2edef17bd21cf44b81d1c4fe004e72"
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
