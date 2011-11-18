/* 
 * This is a wrapper for the pde file so it will compile.
 */
 
#include <WProgram.h>
#include "general.h"


/* Here's the pde file we're going to compile. */
#include "arduino_program.pde"


/*
 *  From here on down, we need this stuff to run the main loop.
 */
int main(void) {
   /* This initializes the Arduino. */
   init(); 
   
   /* This initializes our program. */
   setup();
   
   /* Run the program in an endless loop. */
   while (TRUE) { 
      loop(); 
   } /* while */
   
   return 0;
} /* main */

