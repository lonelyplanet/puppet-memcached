require 'formula'

class Memcached < Formula
  url "http://memcached.googlecode.com/files/memcached-1.4.14.tar.gz"
  homepage 'http://memcached.org/'
  sha1 'b360a6acf2454452c6fd4a5bdbbc303d85c3ec27'
  version '1.4.14-boxen1'

  depends_on 'libevent'

  def options
    [
      ["--enable-sasl", "Enable SASL support -- disables ASCII protocol!"],
      ["--enable-sasl-pwdb", "Enable SASL with memcached's own plain text password db support -- disables ASCII protocol!"],
    ]
  end

  def install
    args = ["--prefix=#{prefix}"]
    args << "--enable-sasl" if ARGV.include? "--enable-sasl"
    args << "--enable-sasl-pwdb" if ARGV.include? "--enable-sasl-pwdb"

    system "./configure", *args
    system "make install"
  end
end
