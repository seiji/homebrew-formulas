class AwsSessionmanager < Formula
  desc "Session Manager Plugin for the AWS CLI"
  homepage "https://docs.aws.amazon.com/en_pv/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
  url "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip"
  sha256 "a50e31e8cf92c279c3cce01fe0ffe3df1f93134c29ef69315c1cc229e01ffdbb"

  depends_on "awscli"

  def install
    bin.install "bin/session-manager-plugin"
    prefix.install %w[LICENSE VERSION]
  end

  test do
    system bin/"session-manager-plugin"
  end
end
