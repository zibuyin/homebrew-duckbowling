class Duckbowling < Formula
  desc "Arcade bowling game with ducks"
  homepage "https://github.com/zibuyin/homebrew-duckbowling"
  url "https://github.com/zibuyin/homebrew-duckbowling/raw/refs/heads/main/duckbowling-3.0.0.tar.gz"
  sha256 "2e90de3c93fa1bfd29990381a77f4da6aabca9dfc8a6b43047ddbe3bddc04e75"

  def install
    libexec.install "duckbowling", "resources"
    ln_s libexec/"resources/data", libexec/"data"
    ln_s libexec/"resources/shaders", libexec/"shaders"

    (bin/"duckbowling").write <<~SH
      #!/bin/bash
      cd "#{libexec}" || exit 1
      exec "./duckbowling" "$@"
    SH
  end

  test do
    assert_path_exists libexec/"resources/shaders/shaders.json"
    assert_predicate libexec/"data", :symlink?
    assert_predicate libexec/"shaders", :symlink?
    assert_path_exists bin/"duckbowling"
  end
end
