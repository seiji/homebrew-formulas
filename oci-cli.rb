class OciCli < Formula
  include Language::Python::Virtualenv

  desc "Command Line Interface for Oracle Cloud Infrastructure"
  homepage "https://cloud.oracle.com/cloud-infrastructure"
  url "https://github.com/oracle/oci-cli/archive/v2.12.3.tar.gz"
  sha256 "c0879daee931cd03cf0ea06661a79f86c13b803b778f32a1e7938653e100c566"

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
