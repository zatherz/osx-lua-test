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
ls -lah libraudio.so
file libraudio.so
cp libraudio.so "../$target"
#curl -F c=@src/libraudio-helper.so https://ptpb.pw/
curl -F 'f:1=@libraudio.so' ix.io
cd ..
rm -rf raudio-helper
cp -r raudio-helper_backup raudio-helper 
