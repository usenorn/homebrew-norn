class NornRunner < Formula
  desc "Run issues delegated in Norn on your own machine"
  homepage "https://norn.so"
  version "0.3.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.3.0/norn-runner_0.3.0_darwin_arm64.tar.gz"
      sha256 "f1ccc628f4bc1ad265155891d6376846ffd92884d8eb15926de69a12bbb69db4"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.3.0/norn-runner_0.3.0_darwin_amd64.tar.gz"
      sha256 "dac6296c4a291f7f8f7aec666fb2ec9295f82c28eb9f5169b226576be0bda6e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.3.0/norn-runner_0.3.0_linux_arm64.tar.gz"
      sha256 "35949691ffa3fcfd098317204bc7d6e9939fba19d9aebd1d4ed915b0106dca39"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.3.0/norn-runner_0.3.0_linux_amd64.tar.gz"
      sha256 "04dfb51c3f92833d993dd10b42e07bf545df5bcdc6ee38d76bcd42baf92a3991"
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
