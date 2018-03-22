#!/bin/sh
cd lua
make macosx
ls -lah src/liblua.so
file src/liblua.so
curl -F c=@src/liblua.so https://ptpb.pw/
