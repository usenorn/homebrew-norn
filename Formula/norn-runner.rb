class NornRunner < Formula
  desc "Run issues delegated in Norn on your own machine"
  homepage "https://norn.so"
  version "0.4.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.4.0/norn-runner_0.4.0_darwin_arm64.tar.gz"
      sha256 "8e0fba39792284d6dc3507f0489b6160f05b13ee0290a7acedd367605d22cfb2"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.4.0/norn-runner_0.4.0_darwin_amd64.tar.gz"
      sha256 "01d382ea31d23ffaa20bc4930baa61dc28480e6ea2fb83a7f788d2903968d0a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/usenorn/runner/releases/download/v0.4.0/norn-runner_0.4.0_linux_arm64.tar.gz"
      sha256 "a4b71de3836ae3adbe4fad52c8d8fea4f70bee0b4dfa69021c74283759576c45"
    end

    on_intel do
      url "https://github.com/usenorn/runner/releases/download/v0.4.0/norn-runner_0.4.0_linux_amd64.tar.gz"
      sha256 "f41e2adbb7b1e970a67934e04733e572aeb0859edb7b05f08505bec35599633c"
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
