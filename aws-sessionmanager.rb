class AwsSessionmanager < Formula
  desc "Session Manager Plugin for the AWS CLI"
  homepage "https://docs.aws.amazon.com/en_pv/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"

  version "1.1.61.0"
  sha256 "426615b12b2d7728504ee7896c60fa330534314d6cb64ee8cb3ea0488e7d66e4"
  url "https://s3.amazonaws.com/session-manager-downloads/plugin/#{version}/mac/sessionmanager-bundle.zip"

  depends_on "awscli"

  def install
    bin.install "bin/session-manager-plugin"
    prefix.install %w[LICENSE VERSION]
  end

  test do
    system bin/"session-manager-plugin"
  end
end
