# libutf8proc Makefile


# settings

cflags = -O2 -std=c99 -pedantic -Wall -fpic $(CFLAGS)
cc = gcc $(cflags)


# meta targets

c-library: libutf8proc.a libutf8proc.so

ruby-library: ruby/utf8proc_native.so

pgsql-library: pgsql/utf8proc_pgsql.so

all: c-library ruby-library pgsql-library

clean::
	rm -f utf8proc.o libutf8proc.a libutf8proc.so
	cd ruby/ && test -e Makefile && (make clean && rm -f Makefile) || true
	cd pgsql/ && make clean

# real targets

utf8proc.o: utf8proc.h utf8proc.c utf8proc_data.c
	$(cc) -c -o utf8proc.o utf8proc.c

libutf8proc.a: utf8proc.o
	rm -f libutf8proc.a
	ar rs libutf8proc.a utf8proc.o

libutf8proc.so: utf8proc.o
	$(cc) -shared -o libutf8proc.so utf8proc.o
	chmod a-x libutf8proc.so

ruby/Makefile: ruby/extconf.rb
	cd ruby && ruby extconf.rb

ruby/utf8proc_native.so: utf8proc.h utf8proc.c utf8proc_data.c \
		ruby/utf8proc_native.c ruby/Makefile
	cd ruby && make

pgsql/utf8proc_pgsql.so: utf8proc.h utf8proc.c utf8proc_data.c \
		pgsql/utf8proc_pgsql.c
	cd pgsql && make

