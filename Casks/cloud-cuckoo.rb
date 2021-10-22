cask "cloud-cuckoo" do
  name "Cloud Cuckoo"
  desc "Cloud Cuckoo"
  homepage "https://github.com/Cloud-Cuckoo/App/"
  app "Cloud Cuckoo.app", target: "App Fair/Cloud Cuckoo.app"
  depends_on macos: ">= :monterey"
  version "0.8.81"
  url "https://github.com/Cloud-Cuckoo/App/releases/download/#{version}/Cloud-Cuckoo-macOS.zip"
  sha256 "2f833e270826ac40b9d40416d002238767b9bbf9d598c1aa2558af318b4cb9f1"
end