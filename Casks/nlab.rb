cask "nlab" do
  version "2.0.1"
  sha256 arm:   "bf76b2b49bfd6bf5328d0cb3d7dd55b1d2b9fedd7f593f9bb8d4dc82236cdbac",
         intel: "bf76b2b49bfd6bf5328d0cb3d7dd55b1d2b9fedd7f593f9bb8d4dc82236cdbac"

  on_arm do
    url "https://github.com/nLabs-nScope/nLab/releases/download/v#{version}/nLab-darwin-arm64-#{version}.zip",
        verified: "github.com/nLabs-nScope/nLab/"
  end
  on_intel do
    url "https://github.com/nLabs-nScope/nLab/releases/download/v#{version}/nLab-darwin-x64-#{version}.zip",
        verified: "github.com/nLabs-nScope/nLab/"
  end

  name "nLab"
  desc "nLab application"
  homepage "https://github.com/nLabs-nScope/nLab"

  app "nLab.app"

  # Optional: data to clean up with `--zap`
  zap trash: [
    "~/Library/Application Support/nLab",
    "~/Library/Preferences/org.nscope.plist",
    "~/Library/Saved Application State/org.nScope.savedState",
  ]

  livecheck do
    url :url
    strategy :github_latest
  end
end
