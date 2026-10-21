class Hypr < Formula
  desc "Hyperflow developer CLI"
  homepage "https://hyperting.ai"
  url "https://releases.hyperting.ai/hyperflow/hypr/v0.2.1/aarch64-apple-darwin/hypr-v0.2.1-aarch64-apple-darwin.zip"
  version "0.2.1"
  sha256 "9407add1998350df5757a967f77037c12ef43a749b704c8acfa90820a7348a66"
  license "ISC"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hypr"
    prefix.install "LICENSE"
  end

  test do
    assert_match "hypr 0.2.1", shell_output("#{bin}/hypr --version")
  end
end
