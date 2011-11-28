AC_INIT(libarduino, [0.1], [shawn@ch2a.ca])
AM_INIT_AUTOMAKE

# Allow the user to pass the default arduino build directory.
AC_ARG_VAR(ARDUINO_PREFIX, \
   "The default location for building arduino libraries.")
AC_SUBST(ARDUINO_PREFIX, [${ARDUINO_PREFIX:-'${HOME}/.libarduino'}])

# Need to find out path to tar for data/Makefile.am
AC_PATH_PROG(TAR,  [tar],  [gtar])

# Here's the config files that end with '.in' to run macros on.
AC_CONFIG_FILES([
   Makefile scripts/Makefile lib/Makefile data/Makefile config/Makefile
   scripts/build_libarduino lib/init-functions config/default-config])
AC_OUTPUT

