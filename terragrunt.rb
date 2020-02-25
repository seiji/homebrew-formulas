class Terragrunt < Formula
  desc "Thin wrapper for Terraform e.g. for locking state"
  homepage "https://github.com/gruntwork-io/terragrunt"

  version "0.22.4"
  sha256 "a295b6b3ac00685c4f6fc0177c3b8a4161845bf7000d75ea247991b8933476a0"
  url "https://github.com/gruntwork-io/terragrunt/releases/download/v#{version}/terragrunt_darwin_amd64"

  def install
    bin.install "terragrunt"
    prefix.install %w[LICENSE.txt]
  end

  test do
    system bin/"terragrunt"
  end
end
