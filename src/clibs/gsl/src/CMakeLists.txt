# Module CMake file - builds GSL library for ASciLib (A Science Library)

cmake_minimum_required(VERSION 2.6)

PROJECT(ASCILIB_GSL)

IF(NOT BUILD_LIBS)
  # Building in a local module: Set the module search path manually
  SET (CMAKE_MODULE_PATH ../../../../cmake_modules)
  IF(NOT IS_DIRECTORY ${CMAKE_MODULE_PATH})
    MESSAGE(FATAL_ERROR "Can not find ASciLib context")
  ENDIF(NOT IS_DIRECTORY ${CMAKE_MODULE_PATH})
ENDIF(NOT BUILD_LIBS)

FIND_PACKAGE(Map)

SET(LIBNAME ${MAP_projectname}_gsl-${MAP_VERSION})  # shared library name

SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ../build)

INCLUDE_DIRECTORIES(.)
INCLUDE_DIRECTORIES(./gsl)

ADD_LIBRARY(${LIBNAME} SHARED
  ../../../../contrib/gsl/statistics/minmax.c
  ../../../../contrib/gsl/statistics/mean.c
)

# ---- The following may be required for OSX
# TARGET_LINK_LIBRARIES(${LIBNAME} ${ZLIB_NAME})

INSTALL(TARGETS ${LIBNAME}
  LIBRARY DESTINATION lib
)

