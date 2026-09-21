class Guise < Formula
  desc "Dedicated GitHub identity for coding harnesses"
  homepage "https://github.com/PatrickTulskie/guise"
  url "https://github.com/PatrickTulskie/guise/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "49232dd2ab5bfb811d9685c3264ff1f6f9d045a970e6f562c358f8df2471b5e9"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

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
    assert_equal "guise #{version}", shell_output("#{bin}/guise --version").chomp

    assert_match "no config at #{testpath}/absent",
      shell_output("GUISE_CONFIG=#{testpath}/absent #{bin}/guise which 2>&1", 1)
  end
end
