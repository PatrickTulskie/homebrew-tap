class ThingsSak < Formula
  desc "CLI and MCP server for Things 3"
  homepage "https://github.com/PatrickTulskie/things-sak"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/PatrickTulskie/things-sak/releases/download/v#{version}/things-sak-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bce86f0076270632cdef795380cffcb09227d5f04cd70733a1fab7519dbb6221"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/things-sak/releases/download/v#{version}/things-sak-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7f0e8f333324eaeffc709267e816853e66b11a3f28f5a22b74386056f3ffde64"
    end
  end

  def install
    bin.install "things-sak"
  end

  test do
    assert_equal "things-sak #{version}", shell_output("#{bin}/things-sak --version").chomp
  end
end
