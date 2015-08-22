if [ -z $1] || [ -z $2]
then
echo parameter fehlen
echo parameter 1 ruby version
echo parameter 2 rails version
exit 1
else
echo '######################################################'
echo '############# Install Updates and Tools  #############'
echo '######################################################'
sudo yum update -y
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel -y
echo '##########################################'
echo '############# Install rbenv  #############'
echo '##########################################'
#Clone some repos
git clone git://github.com/sstephenson/rbenv.git $HOME/.rbenv
git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
#Check for include in bash_profile
if grep -Fxq "'.bash_include'" $HOME/.bash_profile
then
    break
else
    echo 'source $HOME/.bash_include' >> $HOME/.bash_profile
    #Create bash profile
    echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' > $HOME/.bash_include
    echo 'eval "$(rbenv init -)"' >> $HOME/.bash_include
fi
#Update shell for local profile
source $HOME/.bash_profile
echo '###########################################'
echo '############# Install Ruby $1 #############'
echo '###########################################'
echo $1
rbenv install -v $1
rbenv global $1
echo "gem: --no-document" > ~/.gemrc
echo "BUNDLER INSTALL"
gem install bundler
ruby -v
bundler -v
echo '############################################'
echo '############# Install Rails $2 #############'
echo '############################################'
echo "installing version $2"
gem install rails -v $2
rbenv rehash
rails -v
echo '################################################'
echo '############# JS runtime with Node #############'
echo '################################################'
sudo yum install epel-release -y
sudo yum install nodejs -y
fi
ruby -v
rails -v
node -v
