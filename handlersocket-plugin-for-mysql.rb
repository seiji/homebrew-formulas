class HandlersocketPluginForMysql < Formula
  desc ""
  homepage ""
  url "https://github.com/DeNA/HandlerSocket-Plugin-for-MySQL/archive/1.1.1.tar.gz"
  version "1.1.1"
  sha256 "72824fa9a2409225f7004b492ee3f33c7fc2d7cf66488d3f826bfa654b3d708c"

  MYSQL_VERSION = '5.6.25'

  depends_on 'autogen'  => :build
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool'  => :build
  depends_on 'mysql'

  def mysql_source_dir
    @mysql_source_dir ||= Dir.mktmpdir 'handlersocket'
  end

  def mysql_plugin_dir
    `/usr/local/bin/brew --prefix mysql`.chomp
  end

  def install
    tgz = File.join HOMEBREW_CACHE, "mysql-#{MYSQL_VERSION}.tar.gz"
    `/usr/local/bin/brew fetch --build-from-source mysql`
    raise "Not found #{tgz} " unless FileTest.exist? tgz

    Dir.chdir mysql_source_dir do
      safe_system 'tar', '-zxf', tgz
    end

    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-mysql-plugindir=#{mysql_plugin_dir}/lib/plugin",
                          "--with-mysql-bindir=#{HOMEBREW_PREFIX}/bin",
                          "--with-mysql-source=#{mysql_source_dir}/mysql-#{MYSQL_VERSION}"
    system "make install"
  end
end
