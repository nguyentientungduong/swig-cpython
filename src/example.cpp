#include "example.h"
#include <iostream>

Example::Example()
{
    x = 10;
    y = 20;
}
int Example::add(int* a, int b)
{
    return *a + b;
}

Example::~Example()
{
}