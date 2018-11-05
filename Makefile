.PHONY: all
all:
	gcc main.c -o main

.PHONY: clean
clean:
	rm main

.PHONY: run
run:
	@./main
