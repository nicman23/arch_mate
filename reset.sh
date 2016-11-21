ver=$1

zsh -c 'echo -n > ~/.cache/notify-*/SHA1SUMS.old'

for i in atril/PKGBUILD ; do
  sed -i -e "s/pkgver=\${_ver}.*/pkgver=\${_ver}.0/g" $i
  sed -i -e "s/=1.16./=$ver/g" $i
  sed -i -e "s/pkgrel=.*/pkgrel=1/g" $i
done
