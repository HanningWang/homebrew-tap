class ManoCua < Formula
  desc "VLA Desktop Automation Client"
  homepage "https://github.com/HanningWang/mano-skill"
  url "https://github.com/HanningWang/mano-skill/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "22d5219b8dcc61c3e5d7e539a6b26ac25dbe7cf2087b2b14f9f79eaf5d801220"
  version "1.0.5"

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
