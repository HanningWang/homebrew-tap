class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-macos-arm64.tar.gz"
      sha256 "07700a57d6904fb5d4e1ab4d2c54dc57db3fb59c56d1a8e74ed6152c5aad6e32"
    else
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-macos-x86_64.tar.gz"
      sha256 "d3dd2f41e5f841e3c7e7eccea00824bd9f91f0952ff40ea9f1c8f19f37741fc5"
    end
  end

  on_linux do
    url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-linux-x86_64.tar.gz"
    sha256 "ab934b9b2f9a4d413c4d84bef99753a9d61ba6b791c78199a726bf803d2d5181"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"fty-nb"
  end

  test do
    assert_match "VLA", shell_output("#{bin}/fty-nb --help", 2)
  end
end
