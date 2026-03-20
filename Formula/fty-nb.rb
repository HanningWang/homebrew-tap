class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.3.0/fty-nb-macos-arm64.tar.gz"
      sha256 "8547fc768dbc2fbff0b072c245310c1907aee4e8e5bd5fa7b66efce54b2080be"
    else
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.3.0/fty-nb-macos-x86_64.tar.gz"
      sha256 "0fe027017d029086f89aa0a8c349e9abcd9652ccbca3d6eb3fd4622c7a84c933"
    end
  end

  on_linux do
    url "https://github.com/HanningWang/mano-skill/releases/download/v0.3.0/fty-nb-linux-x86_64.tar.gz"
    sha256 "b390b3b5346b0b9d560ebcd9c1744cbac2954fd1e78a9f0ab3204403bfa01634"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"fty-nb"
  end

  test do
    assert_match "VLA", shell_output("#{bin}/fty-nb --help", 2)
  end
end
