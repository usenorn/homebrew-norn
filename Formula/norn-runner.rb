class NornRunner < Formula
  desc "Run issues delegated in Norn on your own machine"
  homepage "https://norn.so"
  version "0.5.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.5.0/norn-runner_0.5.0_darwin_arm64.tar.gz"
      sha256 "279eaf2b58d83424c1952628a96d2e37ec42ad5223535756be3d5029b565b19f"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.5.0/norn-runner_0.5.0_darwin_amd64.tar.gz"
      sha256 "ec34b3275bc7dfd2a1ba2823825d0d0b68ade48250c53a90373f5461115a2db6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.5.0/norn-runner_0.5.0_linux_arm64.tar.gz"
      sha256 "e3192be9df11fd87be0b2810341a16f7217f4c52872dd57b6773c8e69863ddc0"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.5.0/norn-runner_0.5.0_linux_amd64.tar.gz"
      sha256 "26c3b205e1a1c2289dcf9c1ef2e9fbe2d6989f9fec00ad2defd3bd510bcad19b"
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
