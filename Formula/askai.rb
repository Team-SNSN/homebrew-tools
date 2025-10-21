class Askai < Formula
    desc "Natural language to shell command helper"
    homepage "https://github.com/Team-SNSN/askai"
    url "https://github.com/Team-SNSN/askai/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "183e28179bf0a7d29aca85a3409278d2c6acf0a752468b0bd5dd3d8c016785f9"
    license "MIT"
    version "0.1.0"

    def install
        bin.install "askai"
    end

    test do
        assert_match "[askai] hello", shell_output("#{bin}/askai hello")
    end
end