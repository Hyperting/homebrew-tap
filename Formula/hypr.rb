class Hypr < Formula
  desc "Hyperflow developer CLI"
  homepage "https://hyperting.ai"
  url "https://releases.hyperting.ai/hyperflow/hypr/v0.1.2/aarch64-apple-darwin/hypr-v0.1.2-aarch64-apple-darwin.zip"
  version "0.1.2"
  sha256 "7790441b964ae8272bc008d2d8b9616f580c083f672fa82364d7b770068cbbdc"
  license "ISC"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hypr"
    prefix.install "LICENSE"
  end

  test do
    assert_match "hypr 0.1.2", shell_output("#{bin}/hypr --version")
  end
end
