class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-macos-arm64.tar.gz"
      sha256 "405245c7a2deb7b2730ad842b15a15982d5603c8dd4ad0e3c8a6b635462d6340"
    else
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-macos-x86_64.tar.gz"
      sha256 "PLACEHOLDER_MACOS_X86_64"
    end
  end

  on_linux do
    url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-linux-x86_64.tar.gz"
    sha256 "PLACEHOLDER_LINUX_X86_64"
  end

  def install
    bin.install "fty-nb"
  end

  test do
    assert_match "VLA", shell_output("#{bin}/fty-nb --help", 2)
  end
end
