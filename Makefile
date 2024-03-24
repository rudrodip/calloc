BIN = bin/main
BUILD_COLOR=\033[32m
LOAD_COLOR=\033[34m
UNLOAD_COLOR=\033[33m
CLEAN_COLOR=\033[31m
RESET_COLOR=\033[0m

build-so:
	@echo "$(BUILD_COLOR)Building memalloc.so...$(RESET_COLOR)"
	@gcc -o memalloc.so -fPIC -shared memalloc.c

build:
	@echo "$(BUILD_COLOR)Building ${BIN}...$(RESET_COLOR)"
	@gcc -o ${BIN} main.c

load-so:
	@echo "$(LOAD_COLOR)Loading memalloc.so...$(RESET_COLOR)"
	@export LD_PRELOAD=$PWD/memalloc.so

unload-so:
	@echo "$(UNLOAD_COLOR)Unloading memalloc.so...$(RESET_COLOR)"
	@export LD_PRELOAD=

run: build build-so load-so
	@echo "$(BUILD_COLOR)Running ${BIN}...$(RESET_COLOR)"
	@./${BIN}
	@make unload-so

clean:
	@echo "$(CLEAN_COLOR)Cleaning up...$(RESET_COLOR)"
	@rm -f ${BIN}
	@rm -f memalloc.so
