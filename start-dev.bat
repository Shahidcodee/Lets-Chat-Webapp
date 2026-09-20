@echo off
set TMP=D:\temp
set TEMP=D:\temp
set npm_config_cache=D:\npm-cache
if not exist D:\temp mkdir D:\temp
if not exist D:\npm-cache mkdir D:\npm-cache
npm run dev:full
