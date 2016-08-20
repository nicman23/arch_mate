ver=$1

for i in */PKGBUILD ; do
  sed -i -e "s/pkgver=\${_ver}.*/pkgver=\${_ver}.0/g" $i
  sed -i -e "s/=1.15/=$ver/g" $i
  sed -i -e "s/pkgrel=.*/pkgrel=1/g" $i
done
