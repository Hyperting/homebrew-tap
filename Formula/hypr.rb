class Hypr < Formula
  desc "Hyperflow developer CLI"
  homepage "https://hyperting.ai"
  url "https://releases.hyperting.ai/hyperflow/hypr/v0.1.4/aarch64-apple-darwin/hypr-v0.1.4-aarch64-apple-darwin.zip"
  version "0.1.4"
  sha256 "e2af5422842dd8d66271dbcbc8cb8495ee05dae19407a6014884e12b1d2e4de9"
  license "ISC"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hypr"
    prefix.install "LICENSE"
  end

  test do
    assert_match "hypr 0.1.4", shell_output("#{bin}/hypr --version")
  end
end
