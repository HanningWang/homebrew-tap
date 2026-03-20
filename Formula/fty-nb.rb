class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  url "https://github.com/HanningWang/mano-skill/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "1f99a607f37f638d28ff45ef5a778980e208497213065b91b661b9a5acca1280"
  version "0.3.0"

  depends_on "python@3.13"

  def install
    venv = libexec/"venv"
    system "python3.13", "-m", "venv", venv
    system venv/"bin/pip", "install", "-r", "requirements.txt"
    (venv/"src").install Dir["visual"]
    (bin/"fty-nb").write <<~SH
      #!/bin/bash
      exec "#{venv}/bin/python3" "#{venv}/src/visual/vla.py" "$@"
    SH
  end

  test do
    assert_match "usage", shell_output("#{bin}/fty-nb --help", 2)
  end
end
