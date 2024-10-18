# Gengine
A 2d game/graphics engine made in c (still in heavy developement)

# Build
There are some steps for the build script to work so i will explain what to do, it's very simple.

# Linux
Make sure that you have SDL2 installed on your system otherwise the script will fail.
You can ensure this by typing "sudo apt-get install libsdl2-dev" if you are on an ubuntu-based system.
On other systems such as fedora, rocky, alma, or any  system that uses yum or dnf you can install
using the following: "sudo dnf install SDL2".

# macOS
Same as Linux, make sure you have SDL2 installed.
You can use the homebrew package manager to install SDL2 like so: "brew install sdl2"
And with that the script should work fine.

# Note:
  - Please move the .clangd in the main directory into the src folder not the src/engine just the src/ with the main and glad.c files.

# Windows
Sorry!, I don't have a windows script for building this engine yet, although i do plan on
in the future.

# Extra note:

Please ensure that the build script moved into the main gengine folder for it to work.
Also ensure that the main.c file where you write the code using the engine is located
in the main src folder along with glad.c.

I hope you enjoy my little project here that i've worked on pretty hard.
I plan on developing this more in the future.

Thank you.
