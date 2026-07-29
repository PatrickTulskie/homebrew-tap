cask "logseq-legacy" do
  arch arm: "arm64", intel: "x64"

  version "0.10.15"
  sha256 arm:   "a0b83e5bdc2b8bb639cec5747cedcc0f0a8cd840ca6fa0d44242dc05312d27cb",
         intel: "adad3a8d50692a79b2643b6c4d36d29ea0cc9d4123f3b48b5f72790a9ec5aca9"

  url "https://github.com/logseq/logseq/releases/download/#{version}/logseq-darwin-#{arch}-#{version}.dmg"
  name "Logseq"
  desc "File-based Logseq, pinned to the final 0.10.x release"
  homepage "https://github.com/logseq/logseq"

  # Deliberately pinned. 0.10.x is the last file-based (markdown) line before the
  # 2.x SQLite rewrite, which cannot open the graphs in iCloud. The version above
  # is fixed, so no `brew upgrade` can move this past 0.10.x.
  livecheck do
    skip "Pinned to the final 0.10.x file-based release"
  end

  auto_updates true

  # Both install /Applications/Logseq.app.
  conflicts_with cask: "logseq"

  depends_on macos: :monterey

  app "Logseq.app"

  caveats <<~EOS
    Logseq's in-app updater offers 2.x, which is the SQLite rewrite and cannot
    open file-based markdown graphs. Disable automatic updates in Settings after
    first launch, otherwise it will migrate you off 0.10.x.

    That setting lives in the app's localStorage, so it cannot be provisioned
    from Ansible and has to be done once per machine by hand.
  EOS

  zap trash: [
    "~/Library/Application Support/Logseq",
    "~/Library/Logs/Logseq",
    "~/Library/Preferences/com.electron.logseq.plist",
    "~/Library/Saved Application State/com.electron.logseq.savedState",
  ]
end
