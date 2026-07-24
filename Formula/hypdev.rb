class Hypdev < Formula
  desc "Hyperflow developer CLI"
  homepage "https://hyperting.ai"
  url "https://releases.hyperting.ai/hyperflow/hypdev/v0.1.1/aarch64-apple-darwin/hypdev-v0.1.1-aarch64-apple-darwin.zip"
  version "0.1.1"
  sha256 "61627f6a7e77cc1686f0bcc7198f0cbe1d5bb8e489b69a9349762cd16521fa8e"
  license "ISC"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hypdev"
    prefix.install "LICENSE"
  end

  test do
    assert_match "hypdev 0.1.1", shell_output("#{bin}/hypdev --version")
  end
end
