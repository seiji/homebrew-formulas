class PhpHandlersocket < Formula
  desc ""
  homepage ""
  url "https://php-handlersocket.googlecode.com/files/php-handlersocket-0.3.1.tar.gz"
  version "0.3.1"
  sha256 "e565bd8ee827edce325105c5af801ea9722282889b7e637c686049e986720922"

  depends_on 'autoconf' => :build
  depends_on "php56"

  def install
    system "phpize"
    system "./configure"
    system "make install"
  end
end
