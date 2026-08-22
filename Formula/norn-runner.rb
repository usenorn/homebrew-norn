class NornRunner < Formula
  desc "Run issues delegated in Norn on your own machine"
  homepage "https://norn.so"
  version "0.1.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.1.0/norn-runner_0.1.0_darwin_arm64.tar.gz"
      sha256 "9163a8ec5bd32bb08ddd5b0a0619b726d2c04f0180b99582ca637c63ee45fb5c"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.1.0/norn-runner_0.1.0_darwin_amd64.tar.gz"
      sha256 "2c74053e46c69dca2b5c66740f93a65c947aaee25606a2469f11f31a268829d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.1.0/norn-runner_0.1.0_linux_arm64.tar.gz"
      sha256 "78a7fe02c98a55d7725ff8714bbd8e56b23a9f792cd8db25b86ca99926ec3133"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.1.0/norn-runner_0.1.0_linux_amd64.tar.gz"
      sha256 "eae5dcb3f7133fa05d5157721fdab183cdfd6329aefe6ec76cc27c70e509458a"
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
