# This is the name of the program we're building and the location of
# the arduino library.
PROGNAME=arduino_program
LIBDIR=../../lib
#LIBDIR=@ARDUINO_LIBDIR@
INCDIR=../../include
#INCDIR=@ARDUINO_INCDIR@
LIBS=-larduino

# Set hardware specific parameters.
MMCU=atmega328p
MHZ=16
AVRDUDE_PARTNO=m328p
SERIAL_PORT=/dev/ttyACM0


# Set up compiler flags.
CFLAGS_HW_CFG := -mmcu=$(MMCU) -DF_CPU=$(MHZ)000000
AVRDUDE_HW_CFG := -p $(AVRDUDE_PARTNO) -c arduino -P$(SERIAL_PORT)
 
CC=avr-g++
CPP=avr-g++
AR=avr-ar
LD=avr-ld
OBJCOPY=avr-objcopy
CFLAGS_ELF_OUTPUT=$(CFLAGS_HW_CFG) -Wall -Os -L $(LIBDIR)
CFLAGS=-c $(CFLAGS_HW_CFG) -Wall -Os -I $(INCDIR)
AVRDUDE_VERBOSITY=
STRIP=avr-strip
 
# We're only compiling main.c which includes the pde file.
SRC := main.c
INC :=
 
OBJ := $(SRC:.c=.o)
 
all: $(PROGNAME)
 
$(PROGNAME): $(PROGNAME).hex
 
$(PROGNAME).hex: $(PROGNAME).elf
	@cp $(PROGNAME).elf $(PROGNAME)_unstripped.elf
	$(STRIP) -s $(PROGNAME).elf
	$(OBJCOPY) -O ihex -R .eeprom $(PROGNAME).elf $(PROGNAME).hex
 
$(PROGNAME).elf: $(OBJ) $(SRC) $(INC)
	$(CC) $(CFLAGS_ELF_OUTPUT) *.o -o $(PROGNAME).elf $(LIBS)
 
upload: $(PROGNAME)
	avrdude $(AVRDUDE_VERBOSITY) -C /etc/avrdude.conf -q -q $(AVRDUDE_HW_CFG) -D -Uflash:w:$(PROGNAME).hex:i
 
clean:
	rm -f *.o
	rm -f *.elf
	rm -f *.hex
	rm -f *~
