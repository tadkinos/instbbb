#!/bin/bash

cd /tmp

wget http://ubuntu.bigbluebutton.org/bigbluebutton.asc -O- | apt-key add -

echo "deb http://us.archive.ubuntu.com/ubuntu/ lucid multiverse" | tee -a /etc/apt/sources.list

echo "deb http://us.archive.ubuntu.com/ubuntu/ lucid main restricted" | tee -a /etc/apt/sources.list

echo "deb http://ubuntu.bigbluebutton.org/lucid_dev_081/ bigbluebutton-lucid main" | tee -a /etc/apt/sources.list


wget http://bigbluebutton.googlecode.com/files/openoffice.org_1.0.4_all.deb

dpkg -i openoffice.org_1.0.4_all.deb

apt-get -y install python-software-properties

apt-add-repository -y ppa:libreoffice/libreoffice-4-0

apt-get -y install libreoffice-common

apt-get -y install libreoffice

apt-get -y install red5

apt-get -y install zlib1g-dev libssl-dev libyaml-dev build-essential bison checkinstall libffi-dev gcc checkinstall libreadline5 libyaml-0-2 libreadline-gplv2-dev

apt-get -y update

apt-get -y dist-upgrade

wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz

tar xvzf ruby-1.9.2-p290.tar.gz

cd ruby-1.9.2-p290

./configure --prefix=/usr\
            --program-suffix=1.9.2\
            --with-ruby-version=1.9.2\
            --disable-install-doc

make

checkinstall -D -y\
            --fstrans=no\
            --nodoc\
            --pkgname='ruby1.9.2'\
            --pkgversion='1.9.2-p290'\
            --provides='ruby'\
            --requires='libc6,libffi-dev,libgdbm3,libncurses5,libreadline5,openssl,libyaml-0-2,zlib1g'\


update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.2 500 \
                         --slave /usr/bin/ri ri /usr/bin/ri1.9.2 \
                         --slave /usr/bin/irb irb /usr/bin/irb1.9.2 \
                         --slave /usr/bin/erb erb /usr/bin/erb1.9.2 \
                         --slave /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.2

update-alternatives --install /usr/bin/gem gem /usr/bin/gem1.9.2 500


apt-get -y install libgmp3c2

apt-get -y install --reinstall libmpfr1ldbl

apt-get -y install nginx nginx-common nginx-full

mkdir /var/www

mkdir /var/www/nginx-default/

touch /var/www/nginx-default/50x.html

gem install gherkin -v '2.2.9' -- --with-cflags=-w

apt-get -y install libssl0.9.8

apt-get -y install default-jdk

apt-get -y install build-essential git-core checkinstall yasm texi2html libvorbis-dev libx11-dev libxfixes-dev zlib1g-dev pkg-config


LIBVPX_VERSION=1.2.0

FFMPEG_VERSION=2.0.1



if [ ! -d "/usr/local/src/libvpx-${LIBVPX_VERSION}" ]; then

  cd /usr/local/src

  git clone http://git.chromium.org/webm/libvpx.git "libvpx-${LIBVPX_VERSION}"

  cd "libvpx-${LIBVPX_VERSION}"

  git checkout "v${LIBVPX_VERSION}"

  ./configure

  make

  checkinstall --pkgname=libvpx --pkgversion="${LIBVPX_VERSION}" --backup=no --deldoc=yes --default

fi



if [ ! -d "/usr/local/src/ffmpeg-${FFMPEG_VERSION}" ]; then

  cd /usr/local/src

  wget "http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2"

  tar -xjf "ffmpeg-${FFMPEG_VERSION}.tar.bz2"

  cd "ffmpeg-${FFMPEG_VERSION}"

  ./configure --enable-version3 --enable-postproc --enable-libvorbis --enable-libvpx

  make

  checkinstall --pkgname=ffmpeg --pkgversion="5:${FFMPEG_VERSION}" --backup=no --deldoc=yes --default

fi

apt-get -y install language-support-fonts-ja
apt-get -y install language-support-ja
apt-get -y install openoffice.org-l10n-ja
apt-get -y install ttf-ipafont

apt-get -y install bigbluebutton

apt-get -y install bbb-demo
