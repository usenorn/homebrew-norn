class NornRunner < Formula
  desc "Run issues delegated in Norn on your own machine"
  homepage "https://norn.so"
  version "0.2.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.2.0/norn-runner_0.2.0_darwin_arm64.tar.gz"
      sha256 "b5e670bd4aa3ad05e4ba0876e155ded1c24919cb060ee506284f52e49ed66fd4"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.2.0/norn-runner_0.2.0_darwin_amd64.tar.gz"
      sha256 "b57984785e6a754b4a6195e614e89165c0b3e0f7bb1e8e67351089d0bc2f4e46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.2.0/norn-runner_0.2.0_linux_arm64.tar.gz"
      sha256 "56e413607af9f935a26898bb3dfa4a156554366dc737066d7b9d9ec34bdff424"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.2.0/norn-runner_0.2.0_linux_amd64.tar.gz"
      sha256 "c577c7a4dd56f9dcd5fae460fa32e2866768a3a1a648ce03f85d5cd7a6bf998a"
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
