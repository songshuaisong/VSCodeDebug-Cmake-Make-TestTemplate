cmake_minimum_required(VERSION 3.0)
 
# 设置C编译器 设置编译参数
set(CMAKE_C_FLAGS "-g -Wall -Werror") # 
# 设置C编译器  #include和lib的位置要和自身安装的位置一致
set(CMAKE_C_COMPILER "gcc") 
# 设置C++编译器 设置编译参数
set(CMAKE_CXX_COMPILER "g++") 
# 设置C++编译器  
set(CMAKE_CXX_FLAGS "-g -Wall -Werror ") 

# CMAKE_ARCHIVE_OUTPUT_DIRECTORY # 默认存放静态库的文件夹位置；
# CMAKE_LIBRARY_OUTPUT_DIRECTORY # 默认存放动态库的文件夹位置；
# LIBRARY_OUTPUT_PATH # 默认存放库文件的位置，如果产生的是静态库并且没有指定 CMAKE_ARCHIVE_OUTPUT_DIRECTORY 则存放在该目录下，动态库也类似；

# 判断编译器类型,如果是gcc编译器,则在编译选项中加入c++11支持
if(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
    message(STATUS "optional:-std=c++11")   
endif(CMAKE_COMPILER_IS_GNUCXX)

# CMAKE_RUNTIME_OUTPUT_DIRECTORY # 存放可执行软件的目录；
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# Cmake的編譯類型 -- 貌似不管用 
# cmake -DCMAKE_BUILD_TYPE=Debug/Release
set(CMAKE_BUILD_TYPE  "Release")
# 添加对不同類型的編譯參數
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g2 -ggdb")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")

# 设置可执行文件的名称
set(TARGET_NAME "main")

PROJECT (PROJECT)

# 源文件列表
set (ADD add/add.c) 
set (SUB sub/sub.c)  
set (MUL mul/mul.c)  
set (DEV dev/dev.c)  
set (MAIN main/main.c) 
# 設置原文件
SET(SRC_LIST ${ADD} ${SUB} ${MUL} ${DEV} ${MAIN})
 
# 头文件列表
include_directories(${CMAKE_SOURCE_DIR}/inc)

# 輸出信息 
message(STATUS "root This is BINARY dir " ${PROJECT_BINARY_DIR})
message(STATUS "root This is SOURCE dir " ${PROJECT_SOURCE_DIR})
message(STATUS "root This is LINKED dir " ${CMAKE_SOURCE_DIR}/lib)
message(STATUS "root This is INCLUDE dir " ${CMAKE_SOURCE_DIR}/inc)
message(STATUS "root This is CURRENT dir " ${CMAKE_CURRENT_SOURCE_DIR})
 
# 設置动态要連接的库的路径
set(DYNAMIC_LIBS_PATH "${CMAKE_CURRENT_SOURCE_DIR}/lib")
# 設置動態庫的屬性
add_library(LIBS_ATTRBUITE SHARED IMPORTED )
# 設置動態庫的名稱
set_target_properties(LIBS_ATTRBUITE PROPERTIES IMPORTED_LOCATION "${DYNAMIC_LIBS_PATH}/libpattern.so")
set(TARGET_DYNAMIC_LIBS LIBS_ATTRBUITE)
  
# 生成目標文件 
ADD_EXECUTABLE(${TARGET_NAME} ${SRC_LIST})  
  
# 链接库文件 
target_link_libraries(${TARGET_NAME} ${TARGET_DYNAMIC_LIBS})

# 生成用戶自定義指令
add_custom_target(run)
add_custom_command(TARGET run
    COMMAND ${CMAKE_COMMAND} -E env LD_LIBRARY_PATH=$(CMAKE_BINARY_DIR)../lib $(CMAKE_BINARY_DIR)/../bin/main
)
add_custom_target(debug)
add_custom_command(TARGET debug
    COMMAND ${CMAKE_COMMAND} -E env LD_LIBRARY_PATH=$(CMAKE_BINARY_DIR)../lib gdb $(CMAKE_BINARY_DIR)/../bin/main
)	

