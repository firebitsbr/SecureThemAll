# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build

# Include any dependencies generated for this target.
include challenges/BitBlaster/CMakeFiles/BitBlaster.dir/depend.make

# Include the progress variables for this target.
include challenges/BitBlaster/CMakeFiles/BitBlaster.dir/progress.make

# Include the compile flags for this target's objects.
include challenges/BitBlaster/CMakeFiles/BitBlaster.dir/flags.make

challenges/BitBlaster/CMakeFiles/BitBlaster.dir/src/main.c.o: challenges/BitBlaster/CMakeFiles/BitBlaster.dir/flags.make
challenges/BitBlaster/CMakeFiles/BitBlaster.dir/src/main.c.o: ../challenges/BitBlaster/src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object challenges/BitBlaster/CMakeFiles/BitBlaster.dir/src/main.c.o"
	cd /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/BitBlaster.dir/src/main.c.o   -c /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/src/main.c

challenges/BitBlaster/CMakeFiles/BitBlaster.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/BitBlaster.dir/src/main.c.i"
	cd /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/src/main.c > CMakeFiles/BitBlaster.dir/src/main.c.i

challenges/BitBlaster/CMakeFiles/BitBlaster.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/BitBlaster.dir/src/main.c.s"
	cd /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster/src/main.c -o CMakeFiles/BitBlaster.dir/src/main.c.s

# Object files for target BitBlaster
BitBlaster_OBJECTS = \
"CMakeFiles/BitBlaster.dir/src/main.c.o"

# External object files for target BitBlaster
BitBlaster_EXTERNAL_OBJECTS =

challenges/BitBlaster/BitBlaster: challenges/BitBlaster/CMakeFiles/BitBlaster.dir/src/main.c.o
challenges/BitBlaster/BitBlaster: challenges/BitBlaster/CMakeFiles/BitBlaster.dir/build.make
challenges/BitBlaster/BitBlaster: include/libcgc.so
challenges/BitBlaster/BitBlaster: include/tiny-AES128-C/libtiny-AES128-C.so
challenges/BitBlaster/BitBlaster: challenges/BitBlaster/CMakeFiles/BitBlaster.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable BitBlaster"
	cd /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/BitBlaster.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
challenges/BitBlaster/CMakeFiles/BitBlaster.dir/build: challenges/BitBlaster/BitBlaster

.PHONY : challenges/BitBlaster/CMakeFiles/BitBlaster.dir/build

challenges/BitBlaster/CMakeFiles/BitBlaster.dir/clean:
	cd /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster && $(CMAKE_COMMAND) -P CMakeFiles/BitBlaster.dir/cmake_clean.cmake
.PHONY : challenges/BitBlaster/CMakeFiles/BitBlaster.dir/clean

challenges/BitBlaster/CMakeFiles/BitBlaster.dir/depend:
	cd /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/challenges/BitBlaster /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster /home/epicosy/thesis/implementation/repair/SecureThemAll2/benchmark/cb-multios/build/challenges/BitBlaster/CMakeFiles/BitBlaster.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : challenges/BitBlaster/CMakeFiles/BitBlaster.dir/depend

