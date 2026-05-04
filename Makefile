CC=gcc
TARGET=t
SRCS=t_lexer.c t_parser.c t_vm.c main.c

test: $(TARGET)
	./$(TARGET) accumulator.t
	./$(TARGET) filter.t
	./$(TARGET) transform.t
	./$(TARGET) fileread.t
	./$(TARGET) sumavg.t

$(TARGET): $(SRCS)
	$(CC) $(SRCS) -o $(TARGET)

clean:
	rm -f $(TARGET)
