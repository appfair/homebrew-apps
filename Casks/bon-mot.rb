cask "bon-mot" do
  version "0.2.44"
  sha256 "2556560f71c195bfd76ab262df2c681d0720a9df5d8810b5a46592d774d553da"

  url "https://github.com/Bon-Mot/App/releases/download/#{version}/Bon-Mot-macOS.zip",
      verified: "github.com/Bon-Mot/"
  name "Bon Mot"
  desc "Simple dictionary app"
  homepage "https://github.com/Bon-Mot/App/"

  depends_on macos: ">= :monterey"
  

  app "Bon Mot.app", target: "App Fair/Bon Mot.app"
  binary "#{appdir}/App Fair/Bon Mot.app/Contents/MacOS/Bon Mot", target: "bon-mot"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Bon Mot.app"
  end

  zap trash: [
    ~/Library/Application Scripts/app.Bon-Mot,
    ~/Library/Application Support/app.Bon-Mot,
    ~/Library/Caches/app.Bon-Mot,
    ~/Library/Containers/app.Bon-Mot,
    ~/Library/HTTPStorages/app.Bon-Mot,
    ~/Library/HTTPStorages/app.Bon-Mot.binarycookies,
    ~/Library/Preferences/app.Bon-Mot.plist,
    ~/Library/Saved Application State/app.Bon-Mot.savedState
  ]
end