#!/usr/bin/env bash
# Points Casks/nowdex.rb at the newest release in Nowdex's Sparkle appcast.
# Prints the new version to $GITHUB_OUTPUT (when set) if the cask changed.
set -euo pipefail

appcast_url="https://updates.nowdex.app/macos/appcast.xml"
cask="Casks/nowdex.rb"

# The appcast lists the newest release first.
read -r short build zip_url < <(curl -fsSL "$appcast_url" | python3 -I -c '
import sys, xml.etree.ElementTree as ET
ns = "{http://www.andymatuschak.org/xml-namespaces/sparkle}"
item = ET.parse(sys.stdin).getroot().find("channel/item")
print(item.findtext(ns + "shortVersionString"), item.findtext(ns + "version"), item.find("enclosure").get("url"))
')

new_version="$short,$build"
current_version=$(sed -n 's/^  version "\(.*\)"$/\1/p' "$cask")

if [[ "$new_version" == "$current_version" ]]; then
  echo "Cask is already at $current_version."
  exit 0
fi

expected_url="https://updates.nowdex.app/macos/Nowdex-$short-$build.zip"
if [[ "$zip_url" != "$expected_url" ]]; then
  echo "Appcast URL $zip_url does not match the cask's URL pattern ($expected_url)." >&2
  exit 1
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
curl -fsSL -o "$tmp/Nowdex.zip" "$zip_url"
sha=$(shasum -a 256 "$tmp/Nowdex.zip" | cut -d' ' -f1)

sed -i.bak \
  -e "s/^  version \".*\"$/  version \"$new_version\"/" \
  -e "s/^  sha256 \".*\"$/  sha256 \"$sha\"/" \
  "$cask"
rm "$cask.bak"

echo "Updated cask from $current_version to $new_version."
if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
  echo "version=$new_version" >> "$GITHUB_OUTPUT"
fi
