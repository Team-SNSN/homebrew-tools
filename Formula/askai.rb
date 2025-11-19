class Askai < Formula
  desc "AI-powered terminal automation tool"
  homepage "https://github.com/Team-SNSN/askai"
  url "https://github.com/Team-SNSN/askai/archive/v0.2.2.tar.gz"
  sha256 "42ecf0d9f5f505e5f518621e13bc73dbd36f8eec8123a267a79207ef30174684"
  license "MIT"
  version "0.2.2"

  depends_on "rust" => :build

  def install
    # Build Rust binary
    system "cargo", "build", "--release", "--locked"

    # Install binary as askai-bin
    bin.install "target/release/askai" => "askai-bin"

    # Create and install wrapper script
    (bin/"askai").write wrapper_script
  end

  def wrapper_script
    <<~EOS
      #!/bin/bash
      # askai wrapper - Homebrew version
      # This script allows commands to be executed in the current shell

      ASKAI_BIN="#{opt_bin}/askai-bin"

      # Pass special options directly to binary
      case "$1" in
          --help|--version|--clear-cache|--prewarm-cache|--daemon-*|--batch|-d|--debug)
              exec "$ASKAI_BIN" "$@"
              ;;
      esac

      # Generate and execute general commands
      if [ $# -eq 0 ]; then
          echo "Usage: askai \\"natural language command\\"" >&2
          echo "Example: askai \\"current time\\"" >&2
          exit 1
      fi

      # Generate command (show user confirmation prompt)
      # Save command using temporary file
      TEMP_FILE=$(mktemp /tmp/askai.XXXXXX)

      # Execute binary (includes user confirmation, all stdin/stdout/stderr connected)
      "$ASKAI_BIN" "$@" > "$TEMP_FILE"
      exit_code=$?

      if [ $exit_code -eq 0 ]; then
          # Read and execute command if user approved
          cmd=$(cat "$TEMP_FILE")
          rm -f "$TEMP_FILE"

          if [ -n "$cmd" ]; then
              # Execute command (using eval)
              eval "$cmd"
          fi
      else
          # If user cancelled or error occurred
          rm -f "$TEMP_FILE"
          exit $exit_code
      fi
    EOS
  end

  def caveats
    <<~EOS
      🎉 askai has been installed!

      You can now use it directly without eval:
        askai "current time"
        askai "change to src directory"
        askai "list all files"

      💡 Shell built-in commands like cd work properly!

      On first use, you need to set up your Gemini API key:
        export GEMINI_API_KEY="your-api-key"

      Get your API key from: https://makersuite.google.com/app/apikey
    EOS
  end

  test do
    assert_match "askai", shell_output("#{bin}/askai --version")
    # Basic functionality test
    system "#{bin}/askai", "--help"
  end
end
