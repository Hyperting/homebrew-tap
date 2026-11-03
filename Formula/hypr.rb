class Hypr < Formula
  desc "Hyperflow developer CLI"
  homepage "https://hyperting.ai"
  version "0.2.1"
  license "ISC"

  on_macos do
    depends_on arch: :arm64
    url "https://releases.hyperting.ai/hyperflow/hypr/v0.2.1/aarch64-apple-darwin/hypr-v0.2.1-aarch64-apple-darwin.zip"
    sha256 "9407add1998350df5757a967f77037c12ef43a749b704c8acfa90820a7348a66"
  end

  on_linux do
    depends_on "glibc"
    depends_on "gcc"
    depends_on "openssl@3"
    depends_on "dbus"
    depends_on "patchelf" => :build
    on_arm do
      url "https://releases.hyperting.ai/hyperflow/hypr/v0.2.1/aarch64-unknown-linux-gnu/hypr-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70a234c4f84138672971f2129ece960db4f7b484982f478c2c2805ef5fcc9dac"
    end
    on_intel do
      url "https://releases.hyperting.ai/hyperflow/hypr/v0.2.1/x86_64-unknown-linux-gnu/hypr-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b3b5b1c76336ff2ffc7063be8e7c29a09c542c80375f859ac8725bb66400481"
    end
  end

  def install
    bin.install "hypr"
    bin.install "hypdev" if OS.linux?
    prefix.install "LICENSE"
    if OS.linux?
      loader = Formula["glibc"].opt_lib/(Hardware::CPU.arm? ? "ld-linux-aarch64.so.1" : "ld-linux-x86-64.so.2")
      rpaths = [Formula["glibc"].opt_lib, Formula["gcc"].opt_lib/"gcc/current", Formula["openssl@3"].opt_lib, Formula["dbus"].opt_lib].join(":")
      %w[hypr hypdev].each do |executable|
        system loader, "--library-path", Formula["glibc"].opt_lib, Formula["patchelf"].opt_bin/"patchelf", "--set-interpreter", loader, "--add-rpath", rpaths, bin/executable
      end
    end
  end

  test do
    assert_match "hypr #{version}", shell_output("#{bin}/hypr --version")
  end
end
