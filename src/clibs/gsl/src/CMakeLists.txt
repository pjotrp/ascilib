# Module CMake file - builds GSL library for ASciLib (A Science Library)

cmake_minimum_required(VERSION 2.6)

PROJECT(ASCILIB_GSL)

IF(NOT BUILD_LIBS)
  # Building in a local module: Set the module search path manually
  SET (CMAKE_MODULE_PATH ${GSL_CONTRIB_PATH}/cmake_modules)
  IF(NOT IS_DIRECTORY ${CMAKE_MODULE_PATH})
    MESSAGE(FATAL_ERROR "Can not find ASciLib context")
  ENDIF(NOT IS_DIRECTORY ${CMAKE_MODULE_PATH})
ENDIF(NOT BUILD_LIBS)

FIND_PACKAGE(Map)

SET(GSL_CONTRIB_PATH ${MAP_ROOT}/contrib/gsl)

SET(LIBNAME ${MAP_projectname}_gsl-${MAP_VERSION})  # shared library name

SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ../build)

INCLUDE_DIRECTORIES(.)
INCLUDE_DIRECTORIES(./gsl)

SET(GSL_CONFIG ${GSL_CONTRIB_PATH}/config.h)

IF (NOT EXISTS ${GSL_CONFIG})
  message("Configuring ./contrib/gsl")
  EXECUTE_PROCESS(
    COMMAND /bin/bash -c ./autogen.sh
    COMMAND /bin/bash -c ./configure --enable-maintainer-mode
    WORKING_DIRECTORY ${GSL_CONTRIB_PATH}
    RESULT_VARIABLE result_gsl
  )
  message("Finished configuring ./contrib/gsl ${result_gsl}")
ENDIF (NOT EXISTS ${GSL_CONFIG})

ADD_LIBRARY(${LIBNAME} SHARED
  ${GSL_CONTRIB_PATH}/statistics/absdev.c
  ${GSL_CONTRIB_PATH}/statistics/covariance.c
  ${GSL_CONTRIB_PATH}/statistics/kurtosis.c
  ${GSL_CONTRIB_PATH}/statistics/lag1.c
  ${GSL_CONTRIB_PATH}/statistics/mean.c
  ${GSL_CONTRIB_PATH}/statistics/median.c
  ${GSL_CONTRIB_PATH}/statistics/minmax.c
  ${GSL_CONTRIB_PATH}/statistics/p_variance.c
  ${GSL_CONTRIB_PATH}/statistics/quantiles.c
  ${GSL_CONTRIB_PATH}/statistics/skew.c
  ${GSL_CONTRIB_PATH}/statistics/ttest.c
  ${GSL_CONTRIB_PATH}/statistics/variance.c
  ${GSL_CONTRIB_PATH}/statistics/wabsdev.c
  ${GSL_CONTRIB_PATH}/statistics/wcovar.c
  ${GSL_CONTRIB_PATH}/statistics/wkurtosis.c
  ${GSL_CONTRIB_PATH}/statistics/wmean.c
  ${GSL_CONTRIB_PATH}/statistics/wskew.c
  ${GSL_CONTRIB_PATH}/statistics/wvariance.c
)

# ---- The following may be required for OSX
# TARGET_LINK_LIBRARIES(${LIBNAME} ${ZLIB_NAME})

INSTALL(TARGETS ${LIBNAME}
  LIBRARY DESTINATION lib
)

