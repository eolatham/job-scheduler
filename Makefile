CC = gcc
CFLAGS = -Wall -lpthread
SOURCES = job_scheduler.c helpers.c
EXECS = job_scheduler

all: $(EXECS)

job_scheduler: $(SOURCES)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(EXECS) *.out *.err
