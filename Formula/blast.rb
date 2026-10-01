# Agent Blast Radius — `brew install makash/tap/blast`
# Prebuilt, checksum-pinned release binaries from github.com/makash/agent-blast-radius.
class Blast < Formula
  desc "See what an AI agent running as you can reach: offline credential exposure scan"
  homepage "https://abr.kloudle.dev"
  version "0.3.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.0/blast-darwin-arm64"
      sha256 "1d4e288425ac77ab4df8990104ef44073b40aeda1d3e5277f5279625d7998348"
    end
    on_intel do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.0/blast-darwin-amd64"
      sha256 "231b050f4ab01a9b3abaf4be279027131dd56a4d7b6bcc8c3e9ef7802be0fd30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.0/blast-linux-arm64"
      sha256 "fc1ba20310d30998f149c56cdd9580547df209dcce191537cda52df6ac2594c4"
    end
    on_intel do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.0/blast-linux-amd64"
      sha256 "7b39e3551aa09c8ce9cef44c3f2dad589837532ec5d30fcca9c696eef48383ab"
    end
  end

  def install
    bin.install Dir["blast-*"].first => "blast"
  end

  def caveats
    <<~EOS
      Run `blast` for the offline scan and share card.
      Run `blast verify` to check which keys are live (paid per check with your own wallet).
      As an MCP server: `blast mcp`.
    EOS
  end

  test do
    assert_match "blast #{version}", shell_output("#{bin}/blast --version")
  end
end
