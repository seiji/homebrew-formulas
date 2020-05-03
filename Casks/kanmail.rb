cask 'kanmail' do
  version "1.2005020754"
  homepage "https://kanmail.io"
  url "https://updates.kanmail.io/Kanmail-mac-#{version}.tar.gz"
  sha256 "05019086b105f2c11c7b9b2898fdfaa95a312383c088a25266b20dfd1da97813"
  name "Kanmail"

  depends_on macos: '>= :high_sierra'
  app "Kanmail.app"
end
