class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-macos-arm64.tar.gz"
      sha256 "516c6837d48f4a63f9a3c21b777dd74032c4343b613230639ef8667473291a6f"
    else
      url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-macos-x86_64.tar.gz"
      sha256 "86ac47a8d43f4359aee0871ce542c1424acef257edd632cba70ef3733dd6e869"
    end
  end

  on_linux do
    url "https://github.com/HanningWang/mano-skill/releases/download/v0.1.0/fty-nb-linux-x86_64.tar.gz"
    sha256 "95e0534f88ae9449703e1ceca507cf090c72b876eba728183f1699f198e58e38"
  end

  def install
    bin.install "fty-nb"
  end

  test do
    assert_match "VLA", shell_output("#{bin}/fty-nb --help", 2)
  end
end
