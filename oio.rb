class Oio < Formula
  desc "CLI for managing notes and ephemeral shorts with authenticated access"
  homepage "https://github.com/sim4gh/oio-cli"
  url "https://github.com/sim4gh/oio-cli/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "58534d08ef8982f7a8c283cb091e7244c975aae270a4e7d19a66868f9a2787e0"
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
    assert_match "1.3.0", shell_output("#{bin}/oio --version")
  end
end
