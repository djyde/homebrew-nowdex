cask "nowdex" do
  version "1.5.0,251"
  sha256 "f8e891b06b5019f35a61f0dbe835fc2210a8b0fbfdd4e240e6165f903242301f"

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
