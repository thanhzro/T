CC = gcc
SRC = src/t_prog_compiler.c
BIN = t_bc
LIBS = -lm -lpthread

all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(SRC) $(LIBS) -o $(BIN)

test: $(BIN)
	python3 check_runtime.py

clean:
	rm -f $(BIN)

selfhost: $(BIN)
	./build_selfhost.sh
