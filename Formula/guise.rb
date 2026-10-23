class Guise < Formula
  desc "Dedicated GitHub identity for coding harnesses"
  homepage "https://github.com/PatrickTulskie/guise"
  version "0.7.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-darwin-arm64.tar.gz"
      sha256 "47c182f19b90a5a5b939e72699653f7554cb044c1f28ba5c7d6237a75420f6bc"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-darwin-amd64.tar.gz"
      sha256 "358238a8ee7e5beeb65a0349294550099d0edb043dfba4077c35b28d2231e23a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-linux-arm64.tar.gz"
      sha256 "11c3e2be28825d315823dbc1b4b92d7a046271b947a1c4426d8fc614d31df52a"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-linux-amd64.tar.gz"
      sha256 "eabed35267c716ce22c3747d91d6488693a6a89dc9c35c83b330b800b461c403"
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
