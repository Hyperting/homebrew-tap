class Hypr < Formula
  desc "Hyperflow developer CLI"
  homepage "https://hyperting.ai"
  url "https://releases.hyperting.ai/hyperflow/hypr/v0.1.3/aarch64-apple-darwin/hypr-v0.1.3-aarch64-apple-darwin.zip"
  version "0.1.3"
  sha256 "ce09032d8bbe7278c45382a3cbd019dab389d50ddc0ba6e35e3c0042a6551e54"
  license "ISC"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hypr"
    prefix.install "LICENSE"
  end

  test do
    assert_match "hypr 0.1.3", shell_output("#{bin}/hypr --version")
  end
end
