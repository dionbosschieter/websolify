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

websolify: websolify.o solsession.o websocket.o
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -lssl -lcrypto -lresolv -o $@

websocket.o: websocket.c websocket.h
websolify.o: websolify.c websocket.h
solsession.o: solsession.c solsession.h

clean:
	$(RM) *.o *~ websolify



