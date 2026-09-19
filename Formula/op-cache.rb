class OpCache < Formula
  desc "Read-through, in-memory cache in front of the 1Password CLI"
  homepage "https://github.com/PatrickTulskie/op-cache"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/PatrickTulskie/op-cache/releases/download/v#{version}/op-cache-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f55e572638cadeed206eac279ff61d883f85efd03024dd5dbf7990dded05df54"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/op-cache/releases/download/v#{version}/op-cache-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fa8804c54af0244de6a0309bf4707b64fbe03aac9c3ecd00554ee1ddfe84fb90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PatrickTulskie/op-cache/releases/download/v#{version}/op-cache-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c7c949915375ad136401797845f46b04ea3e93b40bfe89240fef4d25337fcc0"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/op-cache/releases/download/v#{version}/op-cache-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a01b8623e74bf9c5d55b67307745231f9cecf87b6b2fdcdd001075ffad22b8e"
    end
  end

  def install
    bin.install "op-cache"
  end

  def caveats
    <<~EOS
      op-cache calls the 1Password CLI, which needs to be on your PATH as `op`:

        brew install --cask 1password-cli

      After upgrading, run `op-cache stop` so the next call starts a fresh daemon.
    EOS
  end

  test do
    assert_equal "op-cache #{version}", shell_output("#{bin}/op-cache --version").chomp

    ENV["OP_CACHE_CONFIG"] = testpath/"config.toml"
    ENV["OP_CACHE_SOCKET"] = testpath/"op-cache.sock"
    assert_match(/daemon\s+not running/, shell_output("#{bin}/op-cache status"))
  end
end
