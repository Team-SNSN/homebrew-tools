class Askai < Formula
    desc "Natural language to shell command helper"
    homepage "https://github.com/Team-SNSN/askai/release"
    url "https://github.com/Team-SNSN/askai/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "80630e3974ee6452ef4857d67f7982b69b55a495be440ceab7e81be48c55c560"
    license "MIT"
    version "0.1.0"

    def install
        bin.install "askai"
    end

    test do
        assert_match "[askai] hello", shell_output("#{bin}/askai hello")
    end
end