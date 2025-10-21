class Askai < Formula
    desc "Natural language to shell command helper"
    homepage "https://github.com/Team-SNSN/askai"
    url "https://github.com/Team-SNSN/askai/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "45394e04a546ed4aece9428fa56fdda2391737c46f98e92b5cd5f61d9eac60b4"
    license "MIT"
    version "0.1.0"

    def install
        bin.install "askai"
    end

    test do
        assert_match "[askai] hello", shell_output("#{bin}/askai hello")
    end
end