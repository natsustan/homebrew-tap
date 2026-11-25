cask "prism-app" do
  version "0.13.0"
  sha256 "7d658def80cf993f8b337a0fbcd3cfc3043ef83af57237a816fb80bb1a72404e"

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

  uninstall quit: "com.cosmoss.prism"

  zap trash: [
    "~/Library/Application Support/Prism",
    "~/Library/Caches/Prism",
    "~/Library/Caches/com.cosmoss.prism",
    "~/Library/HTTPStorages/com.cosmoss.prism",
    "~/Library/Preferences/com.cosmoss.prism.plist",
    "~/Library/Saved Application State/com.cosmoss.prism.savedState",
  ]
end
