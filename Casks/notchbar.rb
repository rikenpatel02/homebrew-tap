cask "notchbar" do
  version "0.1.3"
  sha256 "2a118f77ca4009229ea7bcc2fefb074cd0b42b2a06b7975c48fb360e1848e20d"

  url "https://github.com/rikenpatel02/notchbar/releases/download/v#{version}/NotchBar-#{version}.dmg"
  name "NotchBar"
  desc "Dynamic Island for Claude Code with live session status and system stats"
  homepage "https://github.com/rikenpatel02/notchbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "NotchBar.app"

  uninstall quit:       "com.rikenpatel.notchbar",
            login_item: "NotchBar"

  zap trash: "~/Library/Preferences/com.rikenpatel.notchbar.plist"

  caveats <<~EOS
    Open NotchBar from Applications; a setup window connects it to Claude Code.
    Before uninstalling, choose Setup... from its menu bar item and click Disconnect
    to remove its hooks from ~/.claude/settings.json.
  EOS
end
