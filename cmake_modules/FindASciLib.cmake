# - Find ASCILIB settings
#

# ---- Get ASCILIB root
get_filename_component(ASCILIB_ROOT ${CMAKE_MODULE_PATH} PATH)
SET(ASCILIB_CLIBS_PATH ${ASCILIB_ROOT}/src/clibs)

# ---- Get info from ./VERSION file
SET(cat_prog cat)
IF(WIN32)
  IF(NOT UNIX)
    SET(cat_prog type)
  ENDIF(NOT UNIX)
ENDIF(WIN32)

EXEC_PROGRAM(${cat_prog} ARGS ${ASCILIB_ROOT}/VERSION OUTPUT_VARIABLE ASCILIB_VERSION)

# ---- Add a predefinde build variable
add_definitions(-DASCILIB_BUILD)

# ---- Set default installation prefix

IF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  SET(CMAKE_INSTALL_PREFIX /usr)
ENDIF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
message("PREFIX: ${CMAKE_INSTALL_PREFIX}")

# ---- RPATH handling

# use, i.e. don't skip the full RPATH for the build tree
SET(CMAKE_SKIP_BUILD_RPATH  FALSE)

# when building, don't use the install RPATH already
# (but later on when installing)
SET(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE) 

# the RPATH to be used when installing
SET(CMAKE_INSTALL_RPATH "#{CMAKE_INSTALL_PREFIX}/lib")

# don't add the automatically determined parts of the RPATH
# which point to directories outside the build tree to the install RPATH
SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH FALSE)

MESSAGE("CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}")
MESSAGE("ASCILIB_ROOT=${ASCILIB_ROOT}")
MESSAGE("ASCILIB_CLIBS_PATH=${ASCILIB_CLIBS_PATH}")
MESSAGE("ASCILIB_VERSION=${ASCILIB_VERSION}")

# handle the QUIETLY and REQUIRED arguments and set RLIBS_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(xRLibs DEFAULT_MSG ASCILIB_VERSION)

MARK_AS_ADVANCED(
  ASCILIB_ROOT
  ASCILIB_CLIBS_PATH
  ASCILIB_VERSION
  )
