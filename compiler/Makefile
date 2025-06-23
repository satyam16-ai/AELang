# Makefile for ÆLang Compiler (Inside compiler/ directory)

CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Iinclude
SRC = src
INCLUDE = include
BUILD = build

OBJS = $(SRC)/lexer.o $(SRC)/parser.o $(SRC)/codegen.o $(SRC)/main.o

all: $(BUILD)/aelang

$(BUILD)/aelang: $(OBJS)
	@mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

$(SRC)/lexer.o: $(SRC)/lexer.c $(INCLUDE)/lexer.h
	$(CC) $(CFLAGS) -c $< -o $@

$(SRC)/parser.o: $(SRC)/parser.c $(INCLUDE)/parser.h $(INCLUDE)/lexer.h
	$(CC) $(CFLAGS) -c $< -o $@

$(SRC)/codegen.o: $(SRC)/codegen.c $(INCLUDE)/codegen.h $(INCLUDE)/parser.h
	$(CC) $(CFLAGS) -c $< -o $@

$(SRC)/main.o: $(SRC)/main.c $(INCLUDE)/lexer.h $(INCLUDE)/parser.h $(INCLUDE)/codegen.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(SRC)/*.o $(BUILD)/aelang

.PHONY: all clean
