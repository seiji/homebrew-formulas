class Goss < Formula
  desc "Quick and Easy server testing/validation"
  homepage "https://goss.rocks"
  url "https://github.com/aelsabbahy/goss/archive/refs/tags/v0.3.16.tar.gz"
  sha256 "8c17a59ba849a55283169589a3d46a922ee52f65d021411d59971b1b073e244a"
  license "Apache-2.0"
  head "https://github.com/aelsabbahy/goss.git", branch: "master"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", "-ldflags", "-s -w", "-X main.VERSION=v#{version}", *std_go_args,
      "-o", bin/"goss",
      "github.com/aelsabbahy/goss/cmd/goss"

    bin.install "extras/dgoss/dgoss"
    bin.install "extras/dcgoss/dcgoss"
    bin.install "extras/kgoss/kgoss"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goss --version")
  end
end
