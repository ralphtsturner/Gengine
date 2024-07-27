#!/bin/bash

# Set the directories
SRC_DIR="./src"
INCLUDE_DIR="./include"
BUILD_DIR="./build"

# Create the build directory if it doesn't exist
mkdir -p "$BUILD_DIR"

# List all source files
SRCS=$(find "$SRC_DIR" -name '*.c')

EXEC="gengine"

# Set compiler options
CC=gcc
CFLAGS="-Wall -Wextra -std=c99 -I$INCLUDE_DIR"

# Linker options
LDFLAGS="-lSDL2 -ldl"

# Compile each source file individually
for SRC in $SRCS; do
    # Extract file name without extension
    FILENAME=$(basename -- "$SRC")
    FILENAME_NOEXT="${FILENAME%.*}"

    # Compile the source file
    echo "Compiling $FILENAME..."
    $CC $CFLAGS -c "$SRC" -o "$BUILD_DIR/$FILENAME_NOEXT.o"
    if [ $? -ne 0 ]; then
        echo "Error: Compilation failed for $FILENAME"
        exit 1
    fi
done

# Link all object files into the final executable
echo "Linking..."
$CC $CFLAGS "$BUILD_DIR"/*.o -o "$BUILD_DIR/$EXEC" $LDFLAGS
if [ $? -ne 0 ]; then
    echo "Error: Linking failed"
    exit 1
fi

echo "Build successful! Executable is located at: $BUILD_DIR/$EXEC"
