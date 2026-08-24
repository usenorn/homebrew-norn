class NornRunner < Formula
  desc "Run issues delegated in Norn on your own machine"
  homepage "https://norn.so"
  version "0.3.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.3.1/norn-runner_0.3.1_darwin_arm64.tar.gz"
      sha256 "b26239b7b144dfb2da1ebb2e56efa7a0b74b9063248ac2512d014c7f1ac06dfa"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.3.1/norn-runner_0.3.1_darwin_amd64.tar.gz"
      sha256 "1cb5deca4ab9ecebc7315d7330ade015b7c104550515060415afdd108c77d32d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.3.1/norn-runner_0.3.1_linux_arm64.tar.gz"
      sha256 "40c6713581fbea4422a7eb13aa87bb6be29d97dd8e56541c3894f5ea00b1b16f"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.3.1/norn-runner_0.3.1_linux_amd64.tar.gz"
      sha256 "0d7edbc7d9693f466e6a3ec2af87ac10c1853da5b63bd2d055500860b66cbcbb"
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
