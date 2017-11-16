RM = rm -f
TARGETS=websolify
CFLAGS += -fPIC
CFLAGS += -O3 -Wall -g
LDFLAGS +=
LDLIBS += -lipmiconsole

all: $(TARGETS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%: %.o
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

websolify: websolify.o websocket.o
	$(CC) $(LDFLAGS) $^ -lssl -lcrypto -lresolv -o $@

websocket.o: websocket.c websocket.h
websolify.o: websolify.c websocket.h

clean:
	$(RM) *.o *~ websolify



