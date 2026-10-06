# Agent Blast Radius — `brew install makash/tap/blast`
# Prebuilt, checksum-pinned release binaries from github.com/makash/agent-blast-radius.
class Blast < Formula
  desc "See what an AI agent running as you can reach: offline credential exposure scan"
  homepage "https://abr.kloudle.dev"
  version "0.3.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.1/blast-darwin-arm64"
      sha256 "60d022b56d3929303528aa56452e682669adeb9082a803e4ad6ad1b1346eb52d"
    end
    on_intel do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.1/blast-darwin-amd64"
      sha256 "c70657ffba34e57b508e2dfc3fab5e701dbb9c82a082a0605be445efa92dc57d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.1/blast-linux-arm64"
      sha256 "d5893b51198f249bad2e17a5309fae47cd107fa7753f3a8b4cc2c9fa6cf2d07f"
    end
    on_intel do
      url "https://github.com/makash/agent-blast-radius/releases/download/v0.3.1/blast-linux-amd64"
      sha256 "2907790ff016f92d82e086e719c426c1403b8d21a0db8957feaa0de796202906"
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
