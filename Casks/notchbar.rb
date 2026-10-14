cask "notchbar" do
  version "0.1.4"
  sha256 "04c1310319a3245702fef29f657231f0b1f45a15780cecfda1193f469ed02d76"

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
