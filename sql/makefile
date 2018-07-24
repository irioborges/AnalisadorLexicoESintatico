parser: parser.o scanner.o
	gcc -o parser parser.o scanner.o
parser.o: parser.c
	gcc -c parser.c
scanner.o: scanner.c
	gcc -c scanner.c
scanner.c:
	flex -o scanner.c scanner.l
parser.c: parser.y
	bison -d -o parser.c parser.y
