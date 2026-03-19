class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.2.0/fty-nb-macos-arm64.tar.gz"
      sha256 "b675280892204ba2580e8f3f06de9546febae4fa12e6af98bfff13297a42b2b2"
    else
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.2.0/fty-nb-macos-x86_64.tar.gz"
      sha256 "da3af1bfacadabece3dbb98ad8c1a9dbfc5d71e4166e623f0cd1d8be18de7f17"
    end
  end

  on_linux do
    url "https://github.com/HanningWang/mano-skill/releases/download/v0.2.0/fty-nb-linux-x86_64.tar.gz"
    sha256 "345ed316c54a1a49115e2cf39c23294736fd1a1258b89b7ff7419df6ed2d60e1"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"fty-nb"
  end

  test do
    assert_match "VLA", shell_output("#{bin}/fty-nb --help", 2)
  end
end
