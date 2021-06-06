# VSCodeDebug-Cmake-Make-TestTemplate

集成了 Makefile 多文件管理、Cmake构建、VSCode的在线仿真调试等多种功能。

## 一、Makefile
1、在linux环境下，可以支持并执行系列指令：
 - make
 - make test
 - make debug
 - make clean

其中上述的 `make debug` 需要 `gdb` 或者 `cgdb` 的支持。

2、在是不支持windows环境。

## 二、CMake

1、在linux环境下，可以支持并执行系列指令：
 - mkdir build
 - cd build
 - cmake .. OR 其他的cmake编译参数均可
 - make
 - make run 
 - make debug
 - make clean 

其中上述的 `make debug` 需要 `gdb` 或者 `cgdb` 的支持。，同事需要在cmake的时候修改设置：
```cmake
set(CMAKE_BUILD_TYPE  "Release")
```
为
```cmake
set(CMAKE_BUILD_TYPE  "Debug")
```
2、在linux环境下，与Linux环境下一直，只是需要在cmake的时候指定cmake的平台。
 - mkdir build
 - cd build
 - cmake -G"MinGW Makefiles" ../ OR 其他的cmake编译参数均可
 - make ; 里面涉及到了Linux环境下的动态库的参数，需要进行手动修改，下同
 - make run 
 - make debug
 - make clean 

目前在windows环境下出现的情况比较多，暂时先不搞了，等有机会在进行更新。

## 三、VSCode调试

就是一个调试么，自己试试看。



