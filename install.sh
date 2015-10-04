read -p "Enter Ruby version (recommended for imiMaps 2.2.2): " 1
read -p "Enter rails version (recommended for imiMaps 4.2.3) : " 2
read -p "Download imiMaps? [y/N] " prompt 
if [ -z $1] || [ -z $2]
then
echo parameter fehlen
echo parameter $1 ruby version
echo parameter $2 rails version
echo parameter $posgres
echo parameter $redis
exit 1
else
echo '#####################################################'
echo '############# Install Updates and Tools #############'
echo '#####################################################'
sudo yum update -y
sudo yum install -y vim git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl curl-devel sqlite-devel -y
sudo yum groupinstall -y developments
sudo yum install epel-release -y
sudo yum update -y
echo '#########################################'
echo '############# Install rbenv #############'
echo '#########################################'
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
echo '########################################'
echo '############# Install Ruby #############'
echo '########################################'
echo $1
rbenv install -v $1
rbenv global $1
echo "gem: --no-document" > ~/.gemrc
echo "BUNDLER INSTALL"
gem install bundler
ruby -v
bundler -v
echo '#########################################'
echo '############# Install Rails #############'
echo '#########################################'
echo "installing version $2"
gem install rails -v $2
rbenv rehash
rails -v
echo '################################################'
echo '############# JS runtime with Node #############'
echo '################################################'
sudo yum install nodejs -y
fi
echo '#############################################'
echo '############# Download IMI-Maps #############'
echo '#############################################'
if [[ $prompt =~ ^(yes|y)$ ]]
then
	git clone https://github.com/mfps/imiMapR4.git
	mv imiMapR4 /vagrant_data
	cd /vagrant_data/IMI-Maps && bundle install
else
	exit 1
fi
ruby -v
rails -v
node -v
