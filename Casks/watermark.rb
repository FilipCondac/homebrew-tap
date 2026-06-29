cask "watermark" do
  version "1.1.0"
  sha256 "82f1db83dc3888c5ece0b33a15a94f321d7823f9b7f0e92b5b130ff338e3076e"

  url "https://github.com/FilipCondac/watermark/releases/download/v#{version}/WaterMark.zip"
  name "WaterMark"
  desc "Menu-bar estimate of Claude Code water usage"
  homepage "https://github.com/FilipCondac/watermark"

  depends_on arch:  :arm64
  depends_on macos: :ventura

  app "WaterMark.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/WaterMark.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.filipcondac.watermark.plist",
  ]
end
