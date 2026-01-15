CXX = g++
CXXFLAGS = -Wall -std=c++17 -Iinclude -finput-charset=UTF-8 -fexec-charset=CP949

TARGET = simon_app.exe

SRCS = src/utils/simon_tree.cpp src/data/SimonTree.cpp

all: $(TARGET)

$(TARGET): $(SRCS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRCS)

clean:
	rm -f $(TARGET)
