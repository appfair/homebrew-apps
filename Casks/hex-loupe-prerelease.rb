cask "hex-loupe-prerelease" do
  version "0.0.3"
  sha256 "bfceeb48953716175cf39de1b79a7c24b0e44dd12cafb4db9d5cc14f85cdecac"

  url "https://github.com/Hex-Loupe/App/releases/download/#{version}/Hex-Loupe-macOS.zip",
      verified: "github.com/Hex-Loupe/"
  name "Hex Loupe"
  desc "A hex viewer"
  homepage "https://github.com/Hex-Loupe/App/"

  depends_on macos: ">= :monterey"
  

  app "Hex Loupe.app", target: "App Fair/Hex Loupe.app"
  binary "#{appdir}/App Fair/Hex Loupe.app/Contents/MacOS/Hex Loupe", target: "hex-loupe-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Hex Loupe.app"
  end

  zap trash: [
    "~/Library/Caches/app.Hex-Loupe",
    "~/Library/Containers/app.Hex-Loupe",
    "~/Library/Preferences/app.Hex-Loupe.plist",
    "~/Library/Application Scripts/app.Hex-Loupe",
    "~/Library/Saved Application State/app.Hex-Loupe.savedState",
  ]
end