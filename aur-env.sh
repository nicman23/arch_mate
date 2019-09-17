mate_ver=$(git branch | grep \* | cut -d ' ' -f2)
declare -a list
declare -a aurlist

temp=$(find ./*/ -maxdepth 0 | grep -v mate-themes | grep -v caja-extensions | grep -v aur | tr -d ./)

for i in $(echo $temp)
 do list=(${list[@]} $i)
done

mkdir aur &> /dev/null ; if [ "$?" = '0' ]
then
  cd aur
  for i in ${list[@]} caja-extensions-common ; do git clone git+ssh://aur@aur.archlinux.org/$i-dev.git ; done
else
  cd aur
fi

for i in ${list[@]} caja-extensions-common
  do if [ -z "$( cat ../$i/PKGBUILD | grep 123123321)" ] ; then
    cp -r  ../$i/* ./$i-dev/
    else list=( ${list[@]/$i\b} )
  fi
done


for i in ${list[@]}
  do aurlist=(${aurlist[@]} $i-dev)
done

#aurlist=(${aurlist[@]} mate-themes-$theme_ver-gtk3)

b='pkgname="${_pkgbase}-dev"'
c=">=$mate_ver"
d="-dev"
for i in ${aurlist[@]}
  do a=$(cat $i/PKGBUILD | grep 'pkgname="${_pkgbase}"') ; if [ ! -z $a ]
    then sed -i -e "s/$a/$b/g" $i/PKGBUILD
  fi
  sed -i -e "s/$c/$d/g" $i/PKGBUILD
done


#caja extensions bs
a="caja>=$mate_ver" ; b="caja-dev"
sed -i -e "s/$a/$b/g" ./caja-extensions-common-dev/PKGBUILD
a="-dev" ; b=">=$mate_ver" ; c='-dev-dev'
for i in 'mate-common' 'caja-extensions-common' 'caja-gksu' 'caja-image-converter' 'caja-open-terminal' 'caja-sendto' 'caja-share' 'caja-wallpaper'; do
  sed -i -e "s/$i(/$i$a(/g" ./caja-extensions-common-dev/PKGBUILD
  sed -i -e "s/$i$b/$i$a/g" ./caja-extensions-common-dev/PKGBUILD
  sed -i -e "s/$i'/$i$a'/g" ./caja-extensions-common-dev/PKGBUILD

done

find_dummy_hash() {
  mgick='123123321'
  for i in $*
    do grep -q $mgick $i/PKGBUILD || echo -n "$i "
  done
}

#gen meta package
a='depends=(' ; b=$(find_dummy_hash ${aurlist[@]/mate-meta-dev} caja-extensions-common-dev)
sed -i -e "/$a/a $b" mate-meta-dev/PKGBUILD

status() {
  if [ -z "$(git status -s)" ]
    then return 0
    else return 1
  fi
}

#commit
for i in ./*/
  do cd $i
    status ; if [ "$?" = '1' ]
    then
      echo "Commiting changes in $(echo $i | sed -e "s/-dev\///g" | sed -e "s/.\///g")"
      makepkg --printsrcinfo > .SRCINFO
      git commit -a -m 'auto - see github.com/nicman23/mate_arch' &> /dev/null
      git push &> /dev/null
    fi
  cd ..
done
