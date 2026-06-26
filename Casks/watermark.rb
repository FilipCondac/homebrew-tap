cask "watermark" do
  version "1.0.0"
  sha256 "a802375a1a92531386435b224a691cc674421870bcd4c440ce0af2bcdefad99c"

  url "https://github.com/FilipCondac/watermark/releases/download/v#{version}/WaterMark.zip"
  name "WaterMark"
  desc "Menu-bar estimate of Claude Code water usage"
  homepage "https://github.com/FilipCondac/watermark"

  depends_on arch:  :arm64
  depends_on macos: ">= :ventura"

  app "WaterMark.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/WaterMark.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.filipcondac.watermark.plist",
  ]
end
