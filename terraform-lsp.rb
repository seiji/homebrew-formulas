class TerraformLsp < Formula
  desc "Language Server Protocol for Terraform"
  homepage "https://github.com/juliosueiras/terraform-lsp"

  version "0.0.10"
  sha256 "936dbb076683dca4210286726a2504116407b3c870ac9b58efc4860f6b1c315f"
  url "https://github.com/juliosueiras/terraform-lsp/releases/download/v#{version}/terraform-lsp_#{version}_darwin_amd64.tar.gz"

  def install
    bin.install "terraform-lsp"
    prefix.install %w[LICENSE]
  end

  test do
    system bin/"terraform-lsp"
  end
end
