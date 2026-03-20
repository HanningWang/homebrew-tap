class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.3.0/fty-nb-macos-arm64.tar.gz"
      sha256 "5c7c2554d89470d08c7f2f8a428e791b102ff480f59fa9926addf8f0645a38fb"
    else
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.3.0/fty-nb-macos-x86_64.tar.gz"
      sha256 "c307ce671a1ef145a7147bc160d953d2ef496d3128eccbca7f36545350b272da"
    end
  end

  on_linux do
    url "https://github.com/HanningWang/mano-skill/releases/download/v0.3.0/fty-nb-linux-x86_64.tar.gz"
    sha256 "a1b3d0c5ffef559d02f26079816d03d4875635c13d10cc3c41c931a876a041b6"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"fty-nb"
  end

  test do
    assert_match "VLA", shell_output("#{bin}/fty-nb --help", 2)
  end
end
