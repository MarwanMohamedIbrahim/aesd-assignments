CC = gcc
ifdef CROSS_COMPILE
#aarch64-none-linux-gnu-
CC = $(CROSS_COMPILE)gcc
endif

CFLAGS= 

writer:writer.c	
	$(CC) -o writer writer.c $(CFLAGS)  

clean:
	rm -f *.raw