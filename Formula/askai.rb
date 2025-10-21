class Askai < Formula
    desc "Natural language to shell command helper"
    homepage "https://github.com/Team-SNSN/askai"
    url "https://github.com/Team-SNSN/askai/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "b16b11c17f41f9ac208147b8c19e9d80502d518d183458fa59fe5c18e290c505"
    license "MIT"
    version "0.1.0"

    def install
        bin.install "askai"
    end

    test do
        assert_match "[askai] hello", shell_output("#{bin}/askai hello")
    end
end