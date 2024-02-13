#-------------------------------------------------------------------------------------------
#  Copyright 2023 
#
#
#  Written by Can, Elbistan, Turkey
#  Contact cannytr@gmail.com
#-------------------------------------------------------------------------------------------

#cmake version
cmake_minimum_required(VERSION 3.16)
# your project name
project(SyntacticTypingTest VERSION 0.1.0)

# find includes in the corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# run moc automatically
set(CMAKE_AUTOMOC ON)
# if you're using Widgets and editing .ui forms in Designer
#set(CMAKE_AUTOUIC ON)

message("Looking for Qt...")
# Qt modules (https://doc.qt.io/qt-5/qtmodules.html) you're using in your application
find_package(Qt6 COMPONENTS Core Qml Quick Gui Widgets Test REQUIRED)
if (${Qt6_FOUND})
    message("Found Qt " ${Qt6_VERSION})
else()
    message("Couldn't find Qt")
endif()

# your source files
set(SRC_LIST main.cpp
             documenthandler.cpp)

# add an executable based on the project name and source list
add_executable(${PROJECT_NAME} ${SRC_LIST})
#add_executable(SyntacticTypingTest main.cpp)

set_target_properties(${PROJECT_NAME} PROPERTIES    CXX_STANDARD 20
                                                    CXX_STANDARD_REQUIRED ON
                                                    CXX_EXTENSIONS OFF)

# also tell CMake to link with the libraries from the line 14
# otherwise it'll think that you wanted to find those just for fun and won't link them
target_link_libraries(${PROJECT_NAME} PUBLIC Qt6::Qml
                                             Qt6::Quick
                                             Qt6::Gui
                                             Qt6::Widgets)

add_custom_target(copyQmlFiles ALL
    DEPENDS ${PROJECT_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/qml
    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/qml/ ${CMAKE_BINARY_DIR}/qml
)                                             

                                             
include(CTest)
enable_testing()
set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
