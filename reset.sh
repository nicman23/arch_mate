ver=$1

zsh -c 'echo -n > ~/.cache/notify-*/SHA1SUMS.old'

reset_sha() {
  a=$(cat $@ | grep sha1 | sed -e 's/sha1sums=//' | tr -d \'\(\)\" )
  sed -e "s/$a/123123321/g" -i $@
}

for i in */PKGBUILD ; do
  sed -i -e "s/pkgver=\${_ver}.*/pkgver=\${_ver}.0/g" $i
  sed -i -e "s/1.19/$ver/g" $i
  reset_sha $i
done
