# Compiler settings
CXX = g++

# Include paths (-Isrc ensures "data/SimonTree.h" is found)
INCLUDES = -Iinclude -Isrc

# Compiler flags
# -std=c++17: Required for string_view
# -finput/exec-charset: Support for Korean characters
CXXFLAGS = -Wall -std=c++17 $(INCLUDES) -finput-charset=UTF-8 -fexec-charset=CP949

# ---------------------------------------------------------
# Output Binary Names
# ---------------------------------------------------------
EXEC_P = p_simon_tree.exe
EXEC_ORIG = simon_tree.exe

# ---------------------------------------------------------
# Source & Object Files
# ---------------------------------------------------------
# Shared implementation
SHARED_SRC = src/data/SimonTree.cpp
SHARED_OBJ = $(SHARED_SRC:.cpp=.o)

# Source for p_simon_tree
SRC_P = src/utils/p_simon_tree.cpp
OBJ_P = $(SRC_P:.cpp=.o)

# Source for simon_tree
SRC_ORIG = src/utils/simon_tree.cpp
OBJ_ORIG = $(SRC_ORIG:.cpp=.o)

# ---------------------------------------------------------
# Phony Targets (Run Commands)
# ---------------------------------------------------------
.PHONY: all clean p_simon_tree simon_tree

# Default: Build both executables (do not run)
all: $(EXEC_P) $(EXEC_ORIG)

# Command: make p_simon_tree
# Builds and runs the new P-Simon Tree application
p_simon_tree: $(EXEC_P)
	./$(EXEC_P)

# Command: make simon_tree
# Builds and runs the original Simon Tree application
simon_tree: $(EXEC_ORIG)
	./$(EXEC_ORIG)

# ---------------------------------------------------------
# Build Rules
# ---------------------------------------------------------

# Link p_simon_tree executable
$(EXEC_P): $(OBJ_P) $(SHARED_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Link simon_tree executable
$(EXEC_ORIG): $(OBJ_ORIG) $(SHARED_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile .cpp files to .o files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# ---------------------------------------------------------
# Clean Up
# ---------------------------------------------------------
clean:
	rm -f $(OBJ_P) $(OBJ_ORIG) $(SHARED_OBJ) $(EXEC_P) $(EXEC_ORIG)