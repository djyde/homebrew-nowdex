<p align="center">
  <a href="https://nowdex.app/mac/"><img src="https://nowdex.app/logo.png" alt="Nowdex app icon" width="96" height="96"></a>
</p>

<h1 align="center">Nowdex for Mac — Homebrew Tap</h1>

<p align="center">
  <strong>Install Nowdex with Homebrew: a free macOS menu bar app and desktop widgets that show how much of your Claude Code, Codex, Cursor and other AI coding usage limits you have left, and when they reset.</strong>
</p>

<p align="center">
  <a href="https://nowdex.app/mac/">Website</a> ·
  <a href="https://nowdex.app/blog/">Blog</a> ·
  <a href="https://apps.apple.com/app/id6791450777">iPhone &amp; iPad</a> ·
  <a href="https://nowdex.app/windows/">Windows</a> ·
  <a href="https://nowdex.app/android/">Android</a>
</p>

## Install

```sh
brew install --cask djyde/nowdex/nowdex
```

That's it. Homebrew taps this repository for you. Or tap it first:

```sh
brew tap djyde/nowdex
brew install --cask nowdex
```

In a `Brewfile`:

```ruby
tap "djyde/nowdex"
cask "nowdex"
```

Requires macOS 15.6 (Sequoia) or later, on Apple silicon or Intel.

## What is Nowdex?

Nowdex is an AI coding usage tracker. It puts your remaining quota and reset times for AI coding subscriptions in the Mac menu bar and in desktop widgets, so you know whether a 5-hour or weekly limit will last before you start a long task, without opening a dashboard or running `/status`.

- **Menu bar usage meter:** remaining usage for every connected account next to the clock, with the details one click away. Choose which limits stay visible.
- **Desktop widgets:** remaining usage and reset times for one or several services on your desktop.
- **Every limit you hit:** Claude Code session and weekly limits, Codex 5-hour and weekly limits and reset credits, Cursor included usage, and more.
- **Synced with iPhone and iPad:** turn on iCloud sync to see the same accounts in Home Screen and Lock Screen widgets.
- **Private by design:** credentials stay in your Keychain and your Mac asks each provider for usage directly. There is no Nowdex account and no Nowdex server in between.
- **Free:** the Mac app is free.

### Supported services

Claude (Claude Code), Codex (ChatGPT), Cursor, Grok, Antigravity, Amp, Droid, Kimi, GLM Coding Plan, MiniMax, Qoder, DeepSeek, OpenCode Go, Muse Code, Command Code, Ollama Cloud, OpenRouter, Cline, ZenMux, Volcano Engine and more. See the [full list on nowdex.app](https://nowdex.app/).

## Updating

Nowdex updates itself in the app, so the cask is marked `auto_updates`. `brew upgrade` skips it unless you run:

```sh
brew upgrade --cask --greedy nowdex
```

This tap checks the Nowdex release feed every hour and updates the cask automatically.

## Uninstall

```sh
brew uninstall --cask nowdex
```

To also remove its settings, saved accounts and widget data from this Mac:

```sh
brew uninstall --cask --zap nowdex
```

The Mac App Store version of Nowdex uses the same data, so `--zap` removes that version's data too. Accounts synced over iCloud stay in iCloud.

## FAQ

### Is this the same app as the download on nowdex.app?

Yes. The cask installs the same notarized, Developer ID–signed build as the [Download for Mac](https://nowdex.app/mac/) button, straight from `updates.nowdex.app`.

### Can I switch from the Mac App Store version?

Yes. Quit and delete the App Store version, then install with Homebrew. Your accounts, settings and iCloud sync carry over because both versions share the same data.

### How is Nowdex different from CodexBar or ccusage?

ccusage reads local Claude Code and Codex logs to count tokens and cost; it does not show your subscription limits. CodexBar is a Mac menu bar app for quota. Nowdex shows subscription quota on Mac, iPhone, iPad, Windows and Android. Read the [CodexBar vs. ccusage vs. Nowdex comparison](https://nowdex.app/blog/codexbar-vs-ccusage/).

### How do I check my Claude, Codex or Cursor usage?

- [How to check your Claude usage](https://nowdex.app/blog/how-to-check-claude-usage/) · [Claude usage tracker](https://nowdex.app/claude-usage-tracker/)
- [Codex usage check: weekly and 5-hour limits](https://nowdex.app/blog/codex-usage-check/) · [Codex usage tracker](https://nowdex.app/codex-usage-tracker/)
- [How to check your Cursor usage](https://nowdex.app/blog/cursor-usage/) · [Cursor usage tracker](https://nowdex.app/cursor-usage-tracker/)

## Support

Found a problem with the cask? [Open an issue](https://github.com/djyde/homebrew-nowdex/issues). For anything about the app, write to [hi@taonan.lu](mailto:hi@taonan.lu).
