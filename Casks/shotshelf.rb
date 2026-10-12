cask "shotshelf" do
  version "1.0.1"
  sha256 "9c411b4ae61069fc2f2c7edb2c5f03d41c250436f1190af7600f1d71fd41499d"

  url "https://github.com/rikenpatel02/shotshelf/releases/download/v#{version}/Shotshelf-#{version}.dmg"
  name "Shotshelf"
  desc "Sorts screenshots into folders using on-device OCR"
  homepage "https://github.com/rikenpatel02/shotshelf"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Shotshelf.app"

  uninstall quit:       "app.shotshelf.Shotshelf",
            login_item: "Shotshelf"

  zap trash: [
    "~/.config/shotshelf",
    "~/Library/Application Support/Shotshelf",
    "~/Library/Preferences/app.shotshelf.Shotshelf.plist",
  ]

  caveats <<~EOS
    Uninstalling leaves your sorted screenshots and their folders in place.
    If Shotshelf changed where macOS saves screenshots, change it back with
    Screenshot.app > Options > Save to.
  EOS
end
