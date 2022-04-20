%module example
%include "typemaps.i"

%{
#include "example.h"
%} 

/* Convert from Python --> C */
%typemap(in) int {

    $1 = PyInt_AsLong($input);
}

%typemap(in) int* (int inputData){
    inputData =  PyInt_AsLong($input);
    $1 = &inputData;
}

/* Convert from C --> Python */
%typemap(out) int {
    $result = PyLong_FromLong((long)$1);
}

%include "example.h"