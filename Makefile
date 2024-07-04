# Compiler
CC = g++

# Compiler flags
#CFLAGS = -Wall -Wextra -Werror -std=c++20
CFLAGS = -Wall -Wextra -std=c++20

# Linker flags
LDFLAGS = -lraylib

# Include directory
INCLUDE = -Iinclude

# Source files directory
SRC_DIR = src

# Object files directory
OBJ_DIR = obj

# Target executable name
TARGET = main

# Find all source files in the source directory
SRCS = $(wildcard $(SRC_DIR)/*.cpp)

# Object files are generated in the object directory
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# Default rule
all: $(TARGET)

# Rule to link the target
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS)

# Rule to compile source files to object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

# Rule to clean the workspace
clean:
	rm -f $(OBJ_DIR)/*.o $(TARGET)

# Rule to compile, run, and clean up
run: $(TARGET)
	./$(TARGET)
	make clean

# Phony targets
.PHONY: all clean run