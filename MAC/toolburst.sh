
## homebrew install 可能因为端口问题 万事开头难啊，想其它应用通过 brew 安装管理（包括翻墙 privoxy）
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## privoxy
brew instal privoxy

vim /usr/local/etc/privoxy/config

listen-address 0.0.0.0:8118
forward-socks5 / localhost:1080 . # shadowsocks-ng 的偏好设置中将此端口改为一致

netstat -na | grep 8118 ## 查看效果

#*
function proxy_off(){
unset http_proxy
unset https_proxy
echo -e "已关闭代理"
}

function proxy_on() {
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
export http_proxy="http://127.0.0.1:8118"
export https_proxy=$http_proxy
echo -e "已开启代理"
}
*#

## ruby update
# gem source --remove https://rubygems.org/
# gem sources -a https://gems.ruby-china.org/
sudo gem update --system
sudo gem install -n /usr/local/bin cocoapods
pod setup

## instal zsh
brew install zsh
## bash => zsh
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)
## oh-my-zsh
## https://www.cnblogs.com/weixuqin/p/7029177.html
## https://medium.com/statementdog-engineering/prettify-your-zsh-command-line-prompt-3ca2acc967f
## https://github.com/mbrubeck/compleat
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## fastlane 安装结束之后 将 fastlane/bin 添加到 ～/.zshrc
brew cask install fastlane

