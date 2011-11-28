#
# Here's the library we're compiling.  By default, we build the arduino 
# library.  To build the other arduino libraries, we need to override 
# LIB, HDR, C_SRC and CPP_SRC.
#
LIBDIR=../../lib
INCDIR=../../include
LIB=Matrix

# Set compiler settings.
CC=avr-gcc
CXX=avr-g++
AR=avr-ar
MMCU=atmega328p
MHZ=16


CFLAGS := -Wall -Os
CFLAGS += -mmcu=$(MMCU) -DF_CPU=$(MHZ)000000   # Arduino Uno
CFLAGS += -I $(INCDIR)
 
CXXFLAGS := -Wall -Os
CXXFLAGS += -mmcu=$(MMCU) -DF_CPU=$(MHZ)000000   # Arduino Uno
CXXFLAGS += -I $(INCDIR)
 

# Set the source files.
#HDR     := binary.h HardwareSerial.h pins_arduino.h Print.h Stream.h WConstants.h wiring.h wiring_private.h WProgram.h WString.h
CPP_SRC := Matrix.cpp
OBJ := $(C_SRC:.c=.o) $(CPP_SRC:.cpp=.o)


# Build the library.
$(LIB): $(OBJ) $(C_SRC) $(CPP_SRC) $(HDR)
	$(AR) rcs $(LIBDIR)/lib$(LIB).a $(OBJ)


all: $(LIB)
 
clean:
	@rm -rfv *.o
	@rm -rfv $(LIBDIR)/lib$(LIB)*.a
