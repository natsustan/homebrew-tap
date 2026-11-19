cask "prism-app" do
  version "0.9.0"
  sha256 "90ae1659ca15c06b2b90960031fce910a55aff3bcce5fc504231385c3ac8450c"

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
