# Directories
SRC_DIR = ./src
INCLUDE_DIR = ./include
BUILD_DIR = ./build

# Compiler options
CC = gcc
DEBUG_CFLAGS = -Wall -Wextra -std=c99 -I$(INCLUDE_DIR) -g
RELEASE_CFLAGS = -Wall -Wextra -std=c99 -I$(INCLUDE_DIR) -O2

# Linker options
LDFLAGS = -lSDL2 -ldl

# Source files and object files
SRCS = $(shell find $(SRC_DIR) -name '*.c')
OBJS_DEBUG = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))
OBJS_RELEASE = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Executable name
EXEC = gengine

# Default target
all: Debug

# Debug build
Debug: CFLAGS = $(DEBUG_CFLAGS)
Debug: $(BUILD_DIR) $(BUILD_DIR)/$(EXEC)
	@echo "Debug build successful! Executable is located at: $(BUILD_DIR)/$(EXEC)"

# Release build
Release: CFLAGS = $(RELEASE_CFLAGS)
Release: $(BUILD_DIR) $(BUILD_DIR)/$(EXEC)
	@echo "Release build successful! Executable is located at: $(BUILD_DIR)/$(EXEC)"

# Create build directory and subdirectories if they don't exist
$(BUILD_DIR)/%: $(SRC_DIR)/%
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

# Compile each source file
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(@D)
	@echo "Compiling $< with $(CFLAGS) flags..."
	$(CC) $(CFLAGS) -c $< -o $@

# Link the object files into the final executable for Debug
$(BUILD_DIR)/$(EXEC): $(OBJS_DEBUG)
	@echo "Linking with Debug flags..."
	$(CC) $(DEBUG_CFLAGS) $(OBJS_DEBUG) -o $@ $(LDFLAGS)

# Link the object files into the final executable for Release
$(BUILD_DIR)/$(EXEC): $(OBJS_RELEASE)
	@echo "Linking with Release flags..."
	$(CC) $(RELEASE_CFLAGS) $(OBJS_RELEASE) -o $@ $(LDFLAGS)

# Clean up build artifacts
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all Debug Release clean
