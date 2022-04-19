SRC := src

.DEFAULT_GOAL := ${SRC}/_example.so

${SRC}/_example.so : ${SRC}/example.o ${SRC}/example_wrap.o
	g++ -shared ${SRC}/example.o ${SRC}/example_wrap.o -o ${SRC}/_example.so -lpython3.6m

${SRC}/example.o : ${SRC}/example.cpp
	g++ -c -fPIC -I/usr/include/python3.6m ${SRC}/example.cpp -o ${SRC}/example.o

${SRC}/example_wrap.o : ${SRC}/example_wrap.cxx
	g++ -c -fPIC -I/usr/include/python3.6m ${SRC}/example_wrap.cxx -o ${SRC}/example_wrap.o

${SRC}/example_wrap.cxx ${SRC}/example.py : ${SRC}/example.i ${SRC}/example.h
	swig -python -c++ ${SRC}/example.i

clean:
	rm -f ${SRC}/*.o ${SRC}/*.so ${SRC}/example_wrap.* ${SRC}/example.py*

test:
	python3 test.py

.PHONY: clean test
