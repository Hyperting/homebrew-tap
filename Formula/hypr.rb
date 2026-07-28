class Hypr < Formula
  desc "Hyperflow developer CLI"
  homepage "https://hyperting.ai"
  url "https://releases.hyperting.ai/hyperflow/hypr/v0.1.1/aarch64-apple-darwin/hypr-v0.1.1-aarch64-apple-darwin.zip"
  version "0.1.1"
  sha256 "e661fe93636880dd6955517ee072900c59f972a3183fe76554fb28d514a86382"
  license "ISC"
  revision 1

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "hypr"
    prefix.install "LICENSE"
  end

  test do
    assert_match "hypr 0.1.1", shell_output("#{bin}/hypr --version")
  end
end
