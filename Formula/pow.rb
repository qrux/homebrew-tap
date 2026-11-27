# Written by pow's `make release` from packaging/homebrew/pow.rb.in in
# github.com/qrux/pow; change that file, not this one.
class Pow < Formula
  desc "Live view of power, load, temperature and fans on Apple silicon"
  homepage "https://github.com/qrux/pow"
  url "https://github.com/qrux/pow/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "21e3bdbc2cfdd7b4f805efa5983e7d925edc05582348093d8b61d7fe7e256fcb"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    # C with macOS's frameworks and zlib; the flags are the Makefile's own.
    system "make", "pow", "CFLAGS=-O2 -std=gnu11 -Wall -Wextra -Wno-unused-parameter"
    bin.install "pow"
  end

  test do
    # -h prints the help, whose first lines name pow, and exits 0.
    assert_match "pow: a live view of power", shell_output("#{bin}/pow -h")
  end
end
