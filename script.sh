#!/usr/bin/env bash
lex parser.l
gcc lex.yy.c -lfl
cat codigos_ejemplo/p100.c | ./a.out
