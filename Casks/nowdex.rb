cask "nowdex" do
  version "1.5.2,260"
  sha256 "12334ccf81df0591500f04322ab6e656e87aa5dccffe861dce9c29bd7240ea04"

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
