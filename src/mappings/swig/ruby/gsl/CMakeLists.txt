cmake_minimum_required(VERSION 2.6)
ENABLE_TESTING()

SET (M_NAME gsl)
# SET (M_VERSION 1.11.6)
SET (INTERFACE ruby_${M_NAME}.i)

IF(NOT BUILD_LIBS)
  SET (CMAKE_MODULE_PATH ../../../../../cmake_modules)
ENDIF(NOT BUILD_LIBS)

SET (USE_SWIG_INCLUDEPATH "../../contrib/math--gsl/swig")

# INCLUDE(CMakeBackwardCompatibilityC)
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ascilib)

FIND_PACKAGE(MapRuby)

ADD_TEST(TestRubyGSL ${RUBY_EXECUTABLE} -I../${M_NAME}/ascilib ./../test/test_${M_NAME}.rb)

INSTALL(TARGETS ${M_MODULE}
  LIBRARY DESTINATION ${RUBY_LIB_PATH}/ascilib
)


