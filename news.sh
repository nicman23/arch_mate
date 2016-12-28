#! /usr/bin/zsh
declare -a news_array

firstrun=1

if [ -e ../NEWS ]
  then rm -rf ../NEWS.old ; mv ../NEWS ../NEWS.old ; firstrun=0
fi

mkdir ../NEWS

cd ../NEWS

for i in ../arch_mate/*/ 
  do news_array=( $(echo ${i/arch_mate} | tr -d './') ${news_array[@]} )
done

#hacks
news_array=( caja-extensions ${news_array[@]##caja-extensions-common} )

for i in ${news_array[@]}
  do curl https://raw.githubusercontent.com/mate-desktop/$i/master/NEWS > $i
  if [ "$firstrun" -eq '0' ]
    then news=$(diff $i ../NEWS.old/$i | sed -e '1 d' | sed -e 's/^. //g')
    [ -z "$news" ] || echo -e $i':\n'"$news"'\n'>> ../arch_mate/NEWS
  fi

  #github i am not ddosing you ffs
  sleep 1s

done

rm -rf ../NEWS.old
