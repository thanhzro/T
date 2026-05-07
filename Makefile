CC = gcc
SRC = src/t_lexer.c src/t_parser.c src/t_vm.c src/main.c
BIN = t

all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(SRC) -lm -lcurl -o $(BIN)

test: $(BIN)
	./$(BIN) tests/accumulator.t
	./$(BIN) tests/filter.t
	./$(BIN) tests/sumavg.t
	./$(BIN) tests/basic.t

test-intermediate:
	@echo "No intermediate tests yet"

test-all: test test-intermediate

clean:
	rm -f $(BIN)
