cask "watermark" do
  version "1.2.1"
  sha256 "c53530350ce953bb62f408044fd00df2f1ac701441d0b2e1f6da3cc7ed87a549"

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
