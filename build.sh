#!/bin/sh
if [ "$1" = "--x86" ]; then
  target="$2"
  export CFLAGS="-m32 -std=c11"
  export LDFLAGS=-m32
else
  target="$1"
fi
cp -r raudio-helper raudio-helper_backup
cd raudio-helper
make
ls -lah src/libraudio.so
file src/libraudio.so
cp src/libraudio.so "../$target"
#curl -F c=@src/libraudio-helper.so https://ptpb.pw/
cd ..
rm -rf raudio-helper
cp -r raudio-helper_backup raudio-helper 
