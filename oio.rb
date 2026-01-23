class Oio < Formula
  desc "CLI for managing notes and ephemeral shorts with authenticated access"
  homepage "https://github.com/sim4gh/oio-cli"
  url "https://github.com/sim4gh/oio-cli/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "94ef6fb4795bd4e7b1cd083fffff4b8343a84f3388801c07224e228be322969c"
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
    assert_match "1.2.1", shell_output("#{bin}/oio --version")
  end
end
