class Oio < Formula
  desc "CLI for managing notes and ephemeral shorts with authenticated access"
  homepage "https://github.com/sim4gh/oio-cli"
  url "https://github.com/sim4gh/oio-cli/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "f7ab62b04f83e23ff17fb3c7fc80cc3233552f4c5aec6ff73dd0ce544b70be56"
  license "ISC"

  depends_on "node"

  def install
    # Install dependencies
    system "npm", "install", "--production"

    # Install everything into libexec
    libexec.install Dir["*"]

    # Create wrapper script that calls the CLI
    (bin/"oio").write_env_script("#{libexec}/cli.js", {})
  end

  test do
    assert_match "1.2.2", shell_output("#{bin}/oio --version")
  end
end
