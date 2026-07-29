# homebrew-tap

Personal Homebrew tap.

## Install

```sh
brew tap PatrickTulskie/tap
```

## Casks

### `logseq-legacy`

Logseq **0.10.15** — the last release of the file-based (markdown) line, pinned.

Logseq 2.x is a full rewrite that stores graphs in SQLite and cannot open the
markdown graphs synced through iCloud. The `logseq` cask in homebrew-cask tracks
2.x, and Logseq's own in-app updater will happily move you from 0.10.x onto it.
This cask holds a fixed version so `brew upgrade` can never do that.

```sh
brew install --cask PatrickTulskie/tap/logseq-legacy
```

Installs as `/Applications/Logseq.app`, so it conflicts with the upstream
`logseq` cask. Uninstall that first if present:

```sh
brew uninstall --cask logseq        # does not touch ~/.logseq or your graphs
```

**One manual step after installing:** disable automatic updates in Logseq's
Settings. The app will otherwise offer 2.x and migrate you off the file-based
version. This setting is stored in the app's localStorage rather than a config
file, so it cannot be provisioned from Ansible.

Related: `logseq-og` in homebrew-cask is the same file-based lineage continued
by upstream as a separate app (`Logseq-OG.app`, version reset to 1.0.0). It is
maintained and installs cleanly, but its UI has drifted from 0.10.x enough that
older community themes do not render correctly against it.

#### Changing the pinned version

Edit `version` and both `sha256` values in `Casks/logseq-legacy.rb`. To get the
hashes for another release:

```sh
V=0.10.9
for A in arm64 x64; do
  URL="https://github.com/logseq/logseq/releases/download/$V/logseq-darwin-$A-$V.dmg"
  echo "$A $(curl -sL "$URL" | shasum -a 256 | cut -d' ' -f1)"
done
```

Note that release asset filenames changed case across versions; GitHub serves
them case-insensitively, so the lowercase `logseq-darwin-…` form above works for
both older and newer tags.

## Formulae

None yet.
