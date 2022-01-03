cask "name-sense" do
  version "0.0.15"
  sha256 "d6ecffbe44ad578994819afe09249237708587cd23e30ad2dec7be5131a7145f"

  url "https://github.com/Name-Sense/App/releases/download/#{version}/Name-Sense-macOS.zip",
      verified: "github.com/Name-Sense/"
  name "Name Sense"
  desc "Fork to make an App Fair App"
  homepage "https://github.com/Name-Sense/App/"

  depends_on macos: ">= :monterey"
  

  app "Name Sense.app", target: "App Fair/Name Sense.app"
  binary "#{appdir}/App Fair/Name Sense.app/Contents/MacOS/Name Sense", target: "name-sense"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Name Sense.app"
  end

  zap trash: [
    "~/Library/Caches/app.Name-Sense",
    "~/Library/Containers/app.Name-Sense",
    "~/Library/Preferences/app.Name-Sense.plist",
    "~/Library/Application Scripts/app.Name-Sense",
    "~/Library/Saved Application State/app.Name-Sense.savedState",
  ]
end