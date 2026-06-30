cask "watermark" do
  version "1.2.0"
  sha256 "b0ab08239abd28cb0011c95baeef3a0a5029b5fd0a0f3e98f82d30dcc9c34356"

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
