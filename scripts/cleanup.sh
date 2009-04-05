#! /bin/sh

if [ ! -d src ] ; then
  echo Only run from base dir
fi

for x in cmake_install.cmake CTestTestfile.cmake CMakeCache.txt install_manifest.txt Makefile
do
  rm -vf $x
  find . -name $x -exec rm -v \{\} \;
done

find . -name CMakeFiles -exec rm -rvf \{\} \;
find . -name Testing -exec rm -rvf \{\} \;
find . -name *.so -exec rm -v \{\} \;
find . -name *.o -exec rm -v \{\} \;
rm -v *.tar.gz
rm -v *.tgz
rm -v *.tar.bz2
rm -v *.zip
for x in ascilib-* ; do 
  if [ -d $x ]; then
    rm -rvf $x
  fi
done
