cask "prism-app" do
  version "0.3.1"
  sha256 "38abfcc66d33bcf3d6ef5d287f7b5cc28aa8f2ed0388d188e82f306a9f24142a"

  url "https://download.prismformac.com/Prism-#{version}.dmg"
  name "Prism"
  desc "Keyboard launcher for search, clipboard history, snippets and AI"
  homepage "https://prismformac.com/"

  livecheck do
    url "https://download.prismformac.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Prism.app"

  uninstall quit: "com.cosmostudio.prism"

  zap trash: [
    "~/Library/Application Support/Prism",
    "~/Library/Caches/Prism",
    "~/Library/Caches/com.cosmostudio.prism",
    "~/Library/HTTPStorages/com.cosmostudio.prism",
    "~/Library/Preferences/com.cosmostudio.prism.plist",
    "~/Library/Saved Application State/com.cosmostudio.prism.savedState",
  ]
end
