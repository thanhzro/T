CC = gcc
SRC = src/t_lexer.c src/t_parser.c src/t_vm.c src/main.c
BIN = t

all: $(BIN) test

$(BIN):
	$(CC) $(SRC) -o $(BIN)

test: $(BIN)
	./$(BIN) tests/accumulator.t
	./$(BIN) tests/filter.t
	./$(BIN) tests/sumavg.t

clean:
	rm -f $(BIN)
