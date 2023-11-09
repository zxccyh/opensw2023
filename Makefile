PROJ_DIR = $(PWD)
SRC_DIR = $(PROJ_DIR)/src
INCLUDE_DIR = $(PROJ_DIR)/include
BIN_DIR = $(PROJ_DIR)/bin
OBJ_DIR = $(PROJ_DIR)/obj
LIB_DIR = $(PROJ_DIR)/lib

all: $(BIN_DIR)/myapp

$(BIN_DIR)/myapp: $(OBJ_DIR)/main.o $(LIB_DIR)/libfuncs.a
	mkdir -p ./bin
	gcc $^ -o $@ -static -lfuncs -L$(LIB_DIR)

$(LIB_DIR)/libfuncs.a: $(OBJ_DIR)/func1.o
	mkdir -p ./lib
	ar rv $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p ./obj
	gcc -c $^ -o $@ -I$(INCLUDE_DIR)

clean:
	rm -f $(OBJ_DIR)/*.o
	rm -f $(BIN_DIR)/*
	rm -f $(LIB_DIR)/*