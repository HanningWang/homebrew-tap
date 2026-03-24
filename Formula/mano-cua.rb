class ManoCua < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  url "https://github.com/HanningWang/mano-skill/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fcccb6e6d792f2601782baac7d5c9e2c4145e081dd1a27d16f2ad5ae20992d97"
  version "1.0.0"

  depends_on "python@3.13"
  depends_on "python-tk@3.13"

  def install
    venv = libexec/"venv"
    system "python3.13", "-m", "venv", venv
    system venv/"bin/pip", "install", "-r", "requirements.txt"
    (venv/"src").install Dir["visual"]
    (bin/"mano-cua").write <<~SH
      #!/bin/bash
      export PYTHONPATH="#{venv}/src"
      exec "#{venv}/bin/python3" "#{venv}/src/visual/vla.py" "$@"
    SH
  end

  test do
    assert_match "usage", shell_output("#{bin}/mano-cua --help")
  end
end
