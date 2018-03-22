#!/bin/sh
if [ "$1" = "--x86" ]; then
  export CFLAGS=-m32
  export LDFLAGS=-m32
fi
cp -r lua lua_backup
cd lua
make macosx
ls -lah src/liblua.so
file src/liblua.so
curl -F c=@src/liblua.so https://ptpb.pw/
cd ..
rm -rf lua
cp -r lua_backup lua 
