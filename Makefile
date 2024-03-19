BIN = bin/main

build:
	@echo "Building ${BIN}..."
	@gcc -o ${BIN} main.c

run: build
	@echo "Running ${BIN}..."
	@./${BIN}

clean:
	@echo "Cleaning up..."
	@rm -f ${BIN}
