cask "watermark" do
  version "1.0.1"
  sha256 "d7fee5890db4e3f3382ef70db8ea354e0eceeb61f23b9b711f7ab7d853c45502"

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
