cask "app-fair" do
  version "0.7.312"
  sha256 "8b36ff2cbfc604423ac63295d2ad01f225e1bc1fcfd7e5c108c49d80cf20ba7e"

  url "https://github.com/App-Fair/App/releases/download/#{version}/App-Fair-macOS.zip",
      verified: "github.com/App-Fair/"
  name "App Fair"
  desc "The App Fair catalog browser for discovering & installing macOS apps"
  homepage "https://github.com/App-Fair/App/"

  depends_on macos: ">= :monterey"
  

  app "App Fair.app", target: "App Fair.app"
  binary "#{appdir}/App Fair.app/Contents/MacOS/App Fair", target: "app-fair"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair.app"
  end

  zap trash: [
    "~/Library/Caches/app.App-Fair",
    "~/Library/Containers/app.App-Fair",
    "~/Library/Preferences/app.App-Fair.plist",
    "~/Library/Application Scripts/app.App-Fair",
    "~/Library/Saved Application State/app.App-Fair.savedState",
  ]
end