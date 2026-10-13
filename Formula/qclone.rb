# Written by qclone's `make release` from packaging/homebrew/qclone.rb.in in
# github.com/qrux/qclone; change that file, not this one.
class Qclone < Formula
  desc "Prettier local rclone: cleaner syntax, adaptive parallelism, degraded-SSD rescue"
  homepage "https://github.com/qrux/qclone"
  url "https://github.com/qrux/qclone/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "676fc78024cd3e550514fae6d36c054d2d5710905d5425763f69d535279a07d2"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/qclone"
  end

  test do
    assert_equal "qclone #{version}", shell_output("#{bin}/qclone --version").strip
  end
end
