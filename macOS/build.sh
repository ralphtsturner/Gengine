#!/bin/bash

# Set the directories
SRC_DIR="./src"
INCLUDE_DIR="./include"
BUILD_DIR="./build"

# Create the build directory if it doesn't exist
mkdir -p "$BUILD_DIR"

# Find the SDL2 installation directory
SDL2_PREFIX=$(brew --prefix sdl2 2>/dev/null)
if [ -z "$SDL2_PREFIX" ] || [ ! -d "$SDL2_PREFIX" ]; then
    echo "Error: SDL2 is not installed via Homebrew or could not be found."
    exit 1
fi

# Construct include and library paths
SDL2_INCLUDE_DIR="$SDL2_PREFIX/include"
SDL2_LIB_DIR="$SDL2_PREFIX/lib"

# Debugging output
echo "SDL2 Include Directory: $SDL2_INCLUDE_DIR"
echo "SDL2 Library Directory: $SDL2_LIB_DIR"

# List all source files
SRCS=$(find "$SRC_DIR" -name '*.c')

EXEC="gengine"

# Set compiler options
CC=clang
CFLAGS="-Wall -Wextra -std=c99 -I$INCLUDE_DIR -I$SDL2_INCLUDE_DIR"

# Linker options
LDFLAGS="-L$SDL2_LIB_DIR -lSDL2 -ldl"

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