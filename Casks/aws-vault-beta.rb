cask 'aws-vault-beta' do
  version '6.0.0-beta4'
  sha256 '4ea3442c378fc24caeba5886cec6a13829cfa00271aa65ec4071202dd824235f1'

  url "https://github.com/99designs/aws-vault/releases/download/v#{version}/aws-vault-darwin-amd64.dmg"
  name 'aws-vault'
  homepage 'https://github.com/99designs/aws-vault'

  binary 'aws-vault'
end
