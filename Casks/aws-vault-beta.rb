cask 'aws-vault-beta' do
  version '6.0.0-beta5'
  sha256 '9f5d1ff8e38cdf86d0a36c983370a908e672373fb75af53d2f4cecdb49830a02'

  url "https://github.com/99designs/aws-vault/releases/download/v#{version}/aws-vault-darwin-amd64.dmg"
  name 'aws-vault-beta'
  homepage 'https://github.com/99designs/aws-vault'

  binary 'aws-vault'
end
