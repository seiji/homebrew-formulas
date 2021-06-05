# typed: false
# frozen_string_literal: true

class Terragrunt < Formula
  desc "Thin wrapper for Terraform e.g. for locking state"
  homepage "https://github.com/gruntwork-io/terragrunt"
  url "https://github.com/gruntwork-io/terragrunt/archive/v0.23.34.tar.gz"
  sha256 "72467616719a3b5379af91f89de5a4766bd40b1c996c4e44dafdfb9f5f25e5ee"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, catalina:    "6418d53a1512e6999c1e7cd4749d33f2b42a423dd41b2e89c5892b419b835f98"
    sha256 cellar: :any_skip_relocation, mojave:      "29f7a355fdefadffdb2c00addd5a7306bc14012195c16cdbca3c601b5fda806d"
    sha256 cellar: :any_skip_relocation, high_sierra: "8f1b83c91d84861606cdc8c783da6670dd7a5915ef823572408599aadc687593"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.VERSION=v#{version}", *std_go_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/terragrunt --version")
  end
end
