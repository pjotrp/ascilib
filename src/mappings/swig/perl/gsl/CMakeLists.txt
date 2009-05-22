cmake_minimum_required(VERSION 2.6)

ENABLE_TESTING()

SET (M_NAME gsl)
# SET (M_VERSION '')
SET (INTERFACE perl_${M_NAME}.i)

SET (USE_SWIG_INCLUDEPATH "../../contrib/math--gsl/swig")
# SET (USE_SWIG_FLAGS "-v")

INCLUDE_DIRECTORIES(../../../../clibs/gsl/src/gsl)

IF(NOT BUILD_LIBS)
  SET (MAP_ROOT ../../../../..)
  SET (CMAKE_MODULE_PATH ${MAP_ROOT}/tools/cmake-support/modules)
ENDIF(NOT BUILD_LIBS)

FIND_PACKAGE(MapPerl REQUIRED)

TEST_PERL_BINDINGS()
INSTALL_PERL_BINDINGS()



