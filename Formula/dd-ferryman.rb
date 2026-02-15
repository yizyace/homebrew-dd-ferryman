class DdFerryman < Formula
  desc "Local DNS + HTTPS for .test domains on macOS"
  homepage "https://github.com/yizyace/dd_ferryman"
  version "0.1.0"
  license "Apache-2.0"

  url "https://github.com/yizyace/dd_ferryman/releases/download/v#{version}/dd-ferryman-#{version}-universal-apple-darwin.tar.gz"
  sha256 "5885d4ec937a59400c2cb9da51b4e5d9ed1c0c836a4a6796bc182392962d21b2"

  depends_on :macos

  def install
    bin.install "dd-ferryman"
  end

  def caveats
    <<~EOS
      dd-ferryman requires sudo for port 443, keychain, and resolver setup.

      Start manually:   sudo dd-ferryman start
      Install service:  sudo dd-ferryman install
    EOS
  end

  test do
    assert_match "dd-ferryman", shell_output("#{bin}/dd-ferryman --help")
  end
end
