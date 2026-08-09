class Dfang < Formula
  desc "Defang and refang IOCs (emails, URLs, IP addresses)"
  homepage "https://github.com/PatrickTulskie/dfang"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/PatrickTulskie/dfang/releases/download/v#{version}/dfang-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "951e85ce6273eaba89f60d9bdb112af11d22c05f2987f2eb02bf5ecde9b92223"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/dfang/releases/download/v#{version}/dfang-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bf427a60ff82ee59ee86232d096b3e2a00c63e70c32b6ed138e68fa8b7f13ea3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PatrickTulskie/dfang/releases/download/v#{version}/dfang-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81edfb56f6e078aa256e6a1b65c0899dbc3e025f0eae694ef478b25babd992d3"
    end
    on_intel do
      url "https://github.com/PatrickTulskie/dfang/releases/download/v#{version}/dfang-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c214c8a7b3d3e1382d9810c39863b809fada9304030f060eab2c49e620c15ea6"
    end
  end

  def install
    bin.install "dfang", "rfang"
  end

  test do
    assert_equal "hxxp[://]example[.]com",
      pipe_output(bin/"dfang", "http://example.com\n").chomp
    assert_equal "http://example.com",
      pipe_output(bin/"rfang", "hxxp[://]example[.]com\n").chomp
  end
end
