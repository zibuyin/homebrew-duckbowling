class Duckbowling < Formula
  desc "Arcade bowling game with ducks"
  homepage "https://github.com/zibuyin/homebrew-duckbowling"
  url "file:///opt/homebrew/Library/Taps/zibuyin/homebrew-duckbowling/duckbowling-2.0.0.tar.gz"
  sha256 "84ec68689c86c0d3f24f1b0a4aab4e415ff6e26236412041d12102190f915b1d"

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
