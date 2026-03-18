class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-macos-arm64.tar.gz"
      sha256 "45462cef8881730b990d9a694f3cd377daa4a86f94e0b00524a715b1166ce8f7"
    else
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-macos-x86_64.tar.gz"
      sha256 "e7dd44ecc506cbc567395fb6a828559e27bdffa2342ac180376237ebb96df593"
    end
  end

  on_linux do
    url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-linux-x86_64.tar.gz"
    sha256 "1e3d1888bd9a7960c04096946e186f3f62595710fab3199132839df39c02ee14"
  end

  def install
    bin.install "fty-nb"
  end

  test do
    assert_match "VLA", shell_output("#{bin}/fty-nb --help", 2)
  end
end
