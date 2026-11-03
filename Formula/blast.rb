# Agent Blast Radius — `brew install makash/tap/blast`
# Prebuilt, checksum-pinned release binaries from github.com/makash/agent-blast-radius.
class Blast < Formula
  desc "See what an AI agent running as you can reach: offline credential exposure scan"
  homepage "https://abr.kloudle.dev"
  version "0.3.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.2/blast-darwin-arm64"
      sha256 "36026b1073f1dc7d8691ec2237826dc1daa195ba0a6dfafc9f6ea621a8d5ae60"
    end
    on_intel do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.2/blast-darwin-amd64"
      sha256 "afa265116e41252bd774d2efd44894141a3a6a59838dd9c0b718dc9a01ab8379"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.2/blast-linux-arm64"
      sha256 "7d1e3f5e0db16263ef88a7afd9a99b1eac27fd87eb2a60e1aece3ef472b4c260"
    end
    on_intel do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.2/blast-linux-amd64"
      sha256 "1b24f1075b8c1fcc761f2d3282f49df7d934836ea29f18d002466740c656ba5d"
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
