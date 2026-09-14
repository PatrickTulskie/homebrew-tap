class Guise < Formula
  desc "Dedicated GitHub identity for coding harnesses"
  homepage "https://github.com/PatrickTulskie/guise"
  url "https://github.com/PatrickTulskie/guise/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "efea688e7de7d6d9642832a86723b168b3cd2e695d118871a9d9f10732bd471f"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # A self-contained bash script; the helpers it installs are embedded in it.
  # openssl is only needed to sign App JWTs, and the system one can do that.
  depends_on "gh"
  depends_on "jq"

  def install
    bin.install "bin/guise"
  end

  def caveats
    <<~EOS
      Installing only puts the script on your PATH. To provision an identity:

        guise setup

      That writes its helpers to ~/.local/bin, so make sure that is on your PATH.
    EOS
  end

  test do
    assert_match "usage: guise <command>", shell_output("#{bin}/guise --help")

    assert_match "no config at #{testpath}/absent",
      shell_output("GUISE_CONFIG=#{testpath}/absent #{bin}/guise which 2>&1", 1)
  end
end
