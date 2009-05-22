cmake_minimum_required(VERSION 2.6)
ENABLE_TESTING()

SET (M_NAME gsl)
# SET (M_VERSION 1.11.6)
SET (INTERFACE ruby_${M_NAME}.i)
ENABLE_TESTING()

IF(NOT BUILD_LIBS)
  SET (MAP_ROOT ../../../../..)
  SET (CMAKE_MODULE_PATH ${MAP_ROOT}/tools/cmake-support/modules)
ENDIF(NOT BUILD_LIBS)

SET (USE_SWIG_INCLUDEPATH "../../contrib/math--gsl/swig")
# SET (USE_SWIG_FLAGS "-debug-module;2")

# INCLUDE(CMakeBackwardCompatibilityC)
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ascilib)

FIND_PACKAGE(MapRuby)

TEST_RUBY_BINDINGS()
INSTALL_RUBY_BINDINGS()


