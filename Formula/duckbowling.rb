class Duckbowling < Formula
  desc "DuckBowling CLI tool"
  homepage "https://github.com/zibuyin/duckbowling"
  url "file:///path/to/duckbowling-1.0.0.tar.gz"
  sha256 "<replace_with_actual_sha256>"

  def install
    # Install everything into libexec
    libexec.install Dir["*"]

    # Wrap the binary so it can find resources
    (bin/"duckbowling").write_env_script libexec/"duckbowling",
      DUCKBOWLING_RESOURCES: "#{libexec}/resources"
  end

  test do
    system "#{bin}/duckbowling", "--version"
  end
end