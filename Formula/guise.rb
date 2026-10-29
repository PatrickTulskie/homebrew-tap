class Guise < Formula
  desc "Dedicated GitHub identity for coding harnesses"
  homepage "https://github.com/PatrickTulskie/guise"
  version "0.7.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-darwin-arm64.tar.gz"
      sha256 "acaceb92ef7ca85a6231b8e18626f93109501a4881b09966c1bf4b91222e35f4"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-darwin-amd64.tar.gz"
      sha256 "6a4ea63745b784506939417f69d4ec4f6b2b69f391f37fcb4579456794c7d311"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-linux-arm64.tar.gz"
      sha256 "86cd7947b2bc7f628358ce9fd0e4a53f34242f48ec15d9784803be06e730edd3"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/guise/releases/download/v#{version}/guise-#{version}-linux-amd64.tar.gz"
      sha256 "b1c3388551538a79159b2fa04f01e48d3f9419e919e37a05ee755612b923e938"
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
