cask "ytm-widget" do
  version "1.0.1"

  if Hardware::CPU.intel?
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_x64.dmg"
    sha256 "INTEL_SHA256_PLACEHOLDER" # 機器人會自動替換這裡
  else
    url "https://github.com/kizato1018/ytm-widget/releases/download/v#{version}/ytm-widget_#{version}_aarch64.dmg"
    sha256 "ARM_SHA256_PLACEHOLDER" # 機器人會自動替換這裡
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