cask "next-edit-prerelease" do
  version "0.1.15"
  sha256 "46f1a0c90cc61c1a5aa4e5c798e5c6ecac792c38444d86553325302ee1cff877"

  url "https://github.com/Next-Edit/App/releases/download/#{version}/Next-Edit-macOS.zip",
      verified: "github.com/Next-Edit/"
  name "Next Edit"
  desc "Syntactic Text Editor"
  homepage "https://github.com/Next-Edit/App/"

  depends_on macos: ">= :monterey"
  

  app "Next Edit.app", target: "App Fair/Next Edit.app"
  binary "#{appdir}/App Fair/Next Edit.app/Contents/MacOS/Next Edit", target: "next-edit-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Next Edit.app"
  end

  zap trash: [
    "~/Library/Caches/app.Next-Edit",
    "~/Library/Containers/app.Next-Edit",
    "~/Library/Preferences/app.Next-Edit.plist",
    "~/Library/Application Scripts/app.Next-Edit",
    "~/Library/Saved Application State/app.Next-Edit.savedState",
  ]
end