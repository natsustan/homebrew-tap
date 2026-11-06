cask "prism-app" do
  version "0.4.0"
  sha256 "c4979914a638728cfe8c7adb56c25a6a608454372d337846f6dfa190ac49261f"

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
