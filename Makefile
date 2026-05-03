CC=gcc
TARGET=t
SRCS=t_lexer.c t_parser.c t_vm.c main.c

$(TARGET): $(SRCS)
	$(CC) $(SRCS) -o $(TARGET)

test: $(TARGET)
	./$(TARGET) accumulator.t
	./$(TARGET) filter.t
	./$(TARGET) transform.t
	./$(TARGET) fileread.t
	./$(TARGET) sumavg.t

clean:
	rm -f $(TARGET)
