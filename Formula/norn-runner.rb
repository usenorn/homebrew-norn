class NornRunner < Formula
  desc "Run issues delegated in Norn on your own machine"
  homepage "https://norn.so"
  version "0.4.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.4.1/norn-runner_0.4.1_darwin_arm64.tar.gz"
      sha256 "8127c3f3339b3f1b8a38514c9dd83fc78ba67a33887abad25e6dca236a473132"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.4.1/norn-runner_0.4.1_darwin_amd64.tar.gz"
      sha256 "e4558fee4f10dbbae73851e6f665b27daaf8ffd36f9f33dedfe56eaeb77cd430"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.4.1/norn-runner_0.4.1_linux_arm64.tar.gz"
      sha256 "2b480e60d2bb048700c10a144fd8d3e4b7abe4463f13ea6187ce746ff18c2b2c"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.4.1/norn-runner_0.4.1_linux_amd64.tar.gz"
      sha256 "aabd18d5f404b18eb43d47fcdcc827f8a61f6be7b435b5953b972dcffdc5fcce"
    end
  end

  def install
    bin.install "norn"
  end

  def caveats
    <<~EOS
      Register the runner with this machine's service manager, then bind it to an agent:

        norn runner install
        norn runner connect --token nrn_…
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/norn --version")
  end
end
