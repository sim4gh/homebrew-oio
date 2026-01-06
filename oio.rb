class Oio < Formula
  desc "CLI for managing notes and ephemeral shorts with authenticated access"
  homepage "https://github.com/sim4gh/oio-cli"
  url "https://github.com/sim4gh/oio-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d87d3f601fcae4c5e284434144e7aafe5c4d9e5fc7ff08d5e002fb43f82ccf06"
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
    assert_match "1.1.0", shell_output("#{bin}/oio --version")
  end
end
