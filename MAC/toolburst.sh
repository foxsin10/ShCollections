
## homebrew install 可能因为端口问题
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## ruby update
gem source --remove https://rubygems.org/
gem sources -a https://gems.ruby-china.org/
sudo gem update --system
sudo gem install -n /usr/local/bin cocoapods
pod setup
