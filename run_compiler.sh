#!/bin/bash
# Bash script for compiling and including kaos files ver 0.02
# august0815 10.06.2009
# use with kaos-compiler 
TMP=tmp
rm -f tmp
rm -f $1.cos


# get the included files and
inc $1
# then pass to compiler
kaos -o $1.cos $1

#rm -f tmp
