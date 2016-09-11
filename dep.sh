package=$1

finder() {
if [ "$(echo $@ | grep "$package")" ]
  then echo -n
  else cat "$@" | grep $package | grep -v "$package>="
fi
}

wrong() {
for i in */PKGBUILD 
  do if [ "$(finder $i)" ] 
    then echo $i 
  fi 
done
}

list="$(wrong)"

if [ "$list" ]
  then nano $list
fi
