class Tg < Formula
  desc "command-line interface for telegram"
  homepage "https://github.com/ivoputzer/homebrew-tg"
  version "1.3.1"
  url "https://github.com/vysheng/tg.git", :using => :git, :revision => "6547c0b21b977b327b3c5e8142963f4bc246187a" # tag: ""
  devel do
    version "1.3.2-rc"
    url "https://github.com/vysheng/tg.git", :using => :git, :branch => "master"
  end
  depends_on "libconfig"
  depends_on "readline"
  depends_on "python"
  depends_on "libevent"
  depends_on "jansson"
  depends_on "readline"
  depends_on "lua" => :optional
  depends_on "pkg-config" => :build
  def install
    ENV.append "CFLAGS", "-I/usr/local/opt/readline/include" #"-I/usr/local/include"
    ENV.append "LDFLAGS", "-L/usr/local/opt/readline/lib" # "-L/usr/local/lib"
    system "./configure", "--disable-liblua", "--prefix=#{prefix}"
    system "make", "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "LDFLAGS=#{ENV.ldflags}"
    mv "bin/telegram-cli", "bin/tg"
    bin.install "bin/tg"
  end
end
