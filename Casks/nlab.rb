cask "nlab" do
  version "2.0.0"
  sha256 arm:   "f8c44ec5a71e01e087b6772f9bd8d80753c1652018f17c8b0241bf7ae4cec973",
         intel: "f8c44ec5a71e01e087b6772f9bd8d80753c1652018f17c8b0241bf7ae4cec974"

  on_arm do
    url "https://github.com/nLabs-nScope/nLab/releases/download/#{version}/nLab-darwin-arm64-#{version}.zip",
        verified: "github.com/nLabs-nScope/nLab/"
  end
  on_intel do
    url "https://github.com/nLabs-nScope/nLab/releases/download/#{version}/nLab-darwin-x64-#{version}.zip",
        verified: "github.com/nLabs-nScope/nLab/"
  end

  name "nLab"
  desc "nLab application"
  homepage "https://github.com/nLabs-nScope/nLab"

  app "nLab.app"

  # Optional: data to clean up with `--zap`
  zap trash: [
    "~/Library/Application Support/nLab",
    "~/Library/Preferences/com.nlab.plist",
    "~/Library/Saved Application State/com.nlab.savedState",
  ]

  livecheck do
    url :url
    strategy :github_latest
  end
end
