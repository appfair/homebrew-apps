cask "red-light-green-light" do
  version "0.0.10"
  sha256 "1489abbad962f15a581b08951bcb93836a8932c8324b29589ab591b630f1178a"

  url "https://github.com/Red-Light-Green-Light/App/releases/download/#{version}/Red-Light-Green-Light-macOS.zip",
      verified: "github.com/Red-Light-Green-Light/"
  name "Red Light Green Light"
  desc "무궁화 꽃이 피었습니다"
  homepage "https://github.com/Red-Light-Green-Light/App/"

  depends_on macos: ">= :monterey"
  

  app "Red Light Green Light.app", target: "App Fair/Red Light Green Light.app"
  binary "#{appdir}/App Fair/Red Light Green Light.app/Contents/MacOS/Red Light Green Light", target: "red-light-green-light"

  postflight do
    system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/App Fair/Red Light Green Light.app"
  end

  zap trash: [
    "~/Library/Caches/app.Red-Light-Green-Light",
    "~/Library/Containers/app.Red-Light-Green-Light",
    "~/Library/Preferences/app.Red-Light-Green-Light.plist",
    "~/Library/Application Scripts/app.Red-Light-Green-Light",
    "~/Library/Saved Application State/app.Red-Light-Green-Light.savedState",
  ]
end