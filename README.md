# 


<h2 align="center">- VSCodeDebug-Cmake-Make-TestTemplate - </h2>
<p align="center">C Language Version of the VSCodeDebug, Cmake, Make template Code</p>
 
<p align="center">
    <a href="https://travis-ci.com/songshuaisong/VSCodeDebug-Cmake-Make-TestTemplate"><img alt="Build Status" src="https://travis-ci.com/songshuaisong/VSCodeDebug-Cmake-Make-TestTemplate.svg?token=w1QpzPiLyTL55CJtEDLA&branch=main"></a>
	<a href="http://www.kernel.org"><img alt="Platform (GNU/Linux)" src="https://img.shields.io/badge/platform-GNU/Linux-blue.svg"></a>
    <a href="http://www.windows.org"><img alt="Platform (MinGW/Windows)" src="https://img.shields.io/badge/platform-MinGW/Windows-blue.svg"></a>
    <a href="http://www.apache.org"><img alt="license-Apache2.0" src="https://img.shields.io/badge/license-Apache2.0-yellow.svg"></a>
	<a href="https://mit-license.org/"><img alt="license-Apache2.0" src="https://img.shields.io/badge/license-MIT-yellow.svg"></a>
    <a href="https://cmake.org/"><img alt="cmake" src="https://img.shields.io/badge/cmake->3.0-green.svg"></a>
</p>



    主要是VSCode的调试测试的工程文件
    主要用于在 linux 环境下的 VSCode 的调试 

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



