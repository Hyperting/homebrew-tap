class Hypdev < Formula
  desc "Hyperflow developer CLI"
  homepage "https://hyperting.ai"
  url "https://releases.hyperting.ai/hyperflow/hypdev/v0.1.0/aarch64-apple-darwin/hypdev-v0.1.0-aarch64-apple-darwin.zip"
  sha256 "2c555768de917bfc54b628f039d7dbb53c120c6f127d595d8703c3d88c8d1011"
  license "ISC"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hypdev"
    prefix.install "LICENSE"
  end

  test do
    assert_match "hypdev 0.1.0", shell_output("#{bin}/hypdev --version")
  end
end
