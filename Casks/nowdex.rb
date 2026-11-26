cask "nowdex" do
  version "1.5.1,256"
  sha256 "5a21f64b6b12882c184162040e4bdc387cae9213ceecea5f57a976095b4e3e07"

  url "https://updates.nowdex.app/macos/Nowdex-#{version.csv.first}-#{version.csv.second}.zip"
  name "Nowdex"
  desc "Track Claude Code, Codex, Cursor and other AI coding usage limits"
  homepage "https://nowdex.app/mac/"

  livecheck do
    url "https://updates.nowdex.app/macos/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Nowdex.app"

  zap trash: [
    "~/Library/Application Scripts/group.org.randynamic.nowdex",
    "~/Library/Application Scripts/org.randynamic.nowdex",
    "~/Library/Application Scripts/org.randynamic.nowdex.widget",
    "~/Library/Containers/org.randynamic.nowdex",
    "~/Library/Containers/org.randynamic.nowdex.widget",
    "~/Library/Group Containers/group.org.randynamic.nowdex",
  ]
end
