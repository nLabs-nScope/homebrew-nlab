class Nlab < Formula
  desc "nLab application"
  homepage "https://github.com/nLabs-nScope/nLab"
  version "2.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nLabs-nScope/nLab/releases/download/v2.0.0/nLab-darwin-arm64-2.0.0.zip"
      sha256 "f8c44ec5a71e01e087b6772f9bd8d80753c1652018f17c8b0241bf7ae4cec973"
    else
      url "https://github.com/nLabs-nScope/nLab/releases/download/v2.0.0/nLab-darwin-x64-2.0.0.zip"
      sha256 "f8c44ec5a71e01e087b6772f9bd8d80753c1652018f17c8b0241bf7ae4cec973"
    end
  end

  def install
    app = Dir["*.app"].first
    raise "No .app found in archive!" unless app

    prefix.install app

    (bin/"nlab").write <<~EOS
      #!/bin/bash
      open "#{prefix}/#{File.basename(app)}"
    EOS
  end

  test do
    assert_predicate bin/"nlab", :exist?
  end
end

