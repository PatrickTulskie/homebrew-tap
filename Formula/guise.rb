class Guise < Formula
  desc "Dedicated GitHub identity for coding harnesses"
  homepage "https://github.com/PatrickTulskie/guise"
  version "0.7.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-darwin-arm64.tar.gz"
      sha256 "cfce84bb0f7fc87b41d38cdff750c0b48be4d8843c9c288bf79e42ec4cfc9188"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-darwin-amd64.tar.gz"
      sha256 "2f356d2d6a8aa552542e9c1e32cd59779897780862581b5ec12c4fe2d2884c80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-linux-arm64.tar.gz"
      sha256 "879b436672b90c0d370bfbc77f0f13e3ea0140c5fc5dfe87117b70490c39ce54"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-linux-amd64.tar.gz"
      sha256 "3bd01e58bc7c91dd6523051e52eb9fae58fa57797a750450e6cab324b20473ca"
    end
  end

  def install
    bin.install "guise"
  end

  def caveats
    <<~EOS
      Installing only puts the binary on your PATH. To provision an identity:

        guise setup

      That writes its helpers to ~/.local/bin, so make sure that is on your PATH.
      After upgrading, run `guise update` so those helpers come from the new copy.
    EOS
  end

  test do
    assert_equal "guise #{version}", shell_output("#{bin}/guise --version").chomp

    assert_match "no config at #{testpath}/absent",
      shell_output("GUISE_CONFIG=#{testpath}/absent #{bin}/guise which 2>&1", 1)
  end
end
