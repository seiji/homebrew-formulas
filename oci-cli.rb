class OciCli < Formula
  include Language::Python::Virtualenv

  desc "Command Line Interface for Oracle Cloud Infrastructure"
  homepage "https://cloud.oracle.com/cloud-infrastructure"
  url "https://github.com/oracle/oci-cli/archive/v2.12.3.tar.gz"
  sha256 "80076aa4617557c5a84b2d9bcde35f1cd519e50a80221243bb9c8f562b8a58fb"

  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:", "--ignore-installed", buildpath

    venv.pip_install_and_link buildpath
    bin.install_symlink libexec/"bin/oci"
  end

  test do
    system "#{bin}/oci"
  end
end
