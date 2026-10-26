class Guise < Formula
  desc "Dedicated GitHub identity for coding harnesses"
  homepage "https://github.com/PatrickTulskie/guise"
  version "0.7.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-darwin-arm64.tar.gz"
      sha256 "2cd3af40cf8e76871eed94456f043992d8eff7cd339ea5a5771accc61358f0d3"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-darwin-amd64.tar.gz"
      sha256 "1ca7d7d5aece06427894ca960c31b09e646d8d23b989744996132f54e9f590eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-linux-arm64.tar.gz"
      sha256 "7342ab78cf4f4c8c8672f5efd5ba208a871992a8857d81979ef750e827ac1fc3"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-linux-amd64.tar.gz"
      sha256 "38ac3d5086ad0d5ae173b4daa74ccb87b59ab417b3426d5058791a4697f96654"
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
