cask "nlab" do
  version "2.1.0"
  sha256 arm:   "c730497df7027112b047abe0895e8ae6c7b046be3054065d4dbd11f92099bf40",
         intel: "c730497df7027112b047abe0895e8ae6c7b046be3054065d4dbd11f92099bf40"

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
