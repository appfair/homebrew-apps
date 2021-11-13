cask "numeral-xvixvx-prerelease" do
  version "0.0.4"
  sha256 "c62df3db8bf9b9a100cb40c50184e9cc363fab6d7c5a1c8c3c0ac6756b58eaf4"

  url "https://github.com/Numeral-XVIXVX/App/releases/download/#{version}/Numeral-XVIXVX-macOS.zip",
      verified: "github.com/Numeral-XVIXVX/"
  name "Numeral XVIXVX"
  desc "A simple yet useful app"
  homepage "https://github.com/Numeral-XVIXVX/App/"

  depends_on macos: ">= :monterey"
  depends_on cask: "app-fair"

  app "Numeral XVIXVX.app", target: "App Fair/Numeral XVIXVX.app"
  binary "#{appdir}/App Fair/Numeral XVIXVX.app/Contents/MacOS/Numeral XVIXVX", target: "numeral-xvixvx-prerelease"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Numeral XVIXVX.app"
  end

  uninstall quit: "app.Numeral-XVIXVX"
  zap trash: [
    "~/Library/Caches/app.Numeral-XVIXVX",
    "~/Library/Containers/app.Numeral-XVIXVX",
    "~/Library/Preferences/app.Numeral-XVIXVX.plist",
    "~/Library/Application Scripts/app.Numeral-XVIXVX",
    "~/Library/Saved Application State/app.Numeral-XVIXVX.savedState",
  ]
end