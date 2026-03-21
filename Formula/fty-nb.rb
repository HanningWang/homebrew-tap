class FtyNb < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  url "https://github.com/HanningWang/mano-skill/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "43e37ea6d156c8b5a4e36777a49da7b349ba22f0a4e1758f6aaa59024db5f168"
  version "0.3.0"

  depends_on "python@3.13"
  depends_on "python-tk@3.13"

  def install
    venv = libexec/"venv"
    system "python3.13", "-m", "venv", venv
    system venv/"bin/pip", "install", "-r", "requirements.txt"
    (venv/"src").install Dir["visual"]
    (bin/"fty-nb").write <<~SH
      #!/bin/bash
      export PYTHONPATH="#{venv}/src"
      exec "#{venv}/bin/python3" "#{venv}/src/visual/vla.py" "$@"
    SH
  end

  test do
    assert_match "usage", shell_output("#{bin}/fty-nb --help", 2)
  end
end
