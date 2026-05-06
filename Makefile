CC = gcc
SRC = t_lexer.c t_parser.c t_vm.c main.c
BIN = t

all: $(BIN) test

$(BIN):
	$(CC) $(SRC) -o $(BIN)

test: $(BIN)
	./$(BIN) accumulator.t
	./$(BIN) filter.t
	./$(BIN) sumavg.t

clean:
	rm -f $(BIN)
