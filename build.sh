#!/bin/sh
if [ "$1" = "--x86" ]; then
  target="$2"
  export CFLAGS=-m32
  export LDFLAGS=-m32
else
  target="$1"
fi
cp -r lua lua_backup
cd lua
make macosx
ls -lah src/liblua.so
file src/liblua.so
cp src/liblua.so "../$target"
curl -F c=@src/liblua.so https://ptpb.pw/
cd ..
rm -rf lua
cp -r lua_backup lua 
