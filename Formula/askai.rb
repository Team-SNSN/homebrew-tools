class Askai < Formula
    desc "Natural language to shell command helper"
    homepage "https://github.com/Team-SNSN/askai"
    url "https://github.com/Team-SNSN/askai/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    license "MIT"
    version "0.1.0"

    def install
        bin.install "askai"
    end

    test do
        assert_match "[askai] hello", shell_output("#{bin}/askai hello")
    end
end