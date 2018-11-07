.PHONY: all
all:
	gcc main.c -o main

.PHONY: clean
clean:
	rm -f main

.PHONY: run
run:
	@./main
