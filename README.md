# homebrew-tap

Patrick's personal Homebrew tap: things that aren't in homebrew-core, or that
need to be pinned to a version core won't hold.

```sh
brew tap PatrickTulskie/tap
```

## What's in here

| Name | What it does | Install |
| --- | --- | --- |
| [dfang](https://github.com/PatrickTulskie/dfang) | Defang and refang IOCs — make emails, URLs, and IP addresses unclickable, or give them their teeth back. Installs `rfang` too. | `brew install PatrickTulskie/tap/dfang` |
| [guise](https://github.com/PatrickTulskie/guise) | Gives your coding agents their own GitHub identity, so their commits land as a bot instead of as you. | `brew install PatrickTulskie/tap/guise` |
| [op-cache](https://github.com/PatrickTulskie/op-cache) | Caches 1Password CLI secrets in memory for your login session, so agents and scripts stop stalling on vault-lock prompts. | `brew install PatrickTulskie/tap/op-cache` |
| [logseq-legacy](https://github.com/logseq/logseq) | Logseq 0.10.15, the last file-based (markdown) release, pinned so nothing upgrades you onto the 2.x SQLite rewrite. | `brew install --cask PatrickTulskie/tap/logseq-legacy` |

## Before you install logseq-legacy

It installs `/Applications/Logseq.app` — the same place the `logseq` cask in
homebrew-cask puts 2.x — so remove that one first. It leaves your graphs and
`~/.logseq` alone:

```sh
brew uninstall --cask logseq
```

Then turn off automatic updates in Logseq's settings after first launch, or the
app's own updater will offer 2.x and migrate your graphs to it.
