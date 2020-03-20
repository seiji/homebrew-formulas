class OciCli < Formula
  desc "Command Line Interface for Oracle Cloud Infrastructure"
  homepage "https://cloud.oracle.com/cloud-infrastructure"
  url "https://github.com/oracle/oci-cli/archive/v2.9.7.tar.gz"
  sha256 "9c481b98fb92b9efbb4233b537a7192dcd29a707f5c89370553e8fb207c084f5"

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
