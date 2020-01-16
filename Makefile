.PHONY: all clean native depend

OCB_FLAGS   = -j 8 -use-ocamlfind -use-menhir -I lib -I src
OCB = ocamlbuild $(OCB_FLAGS)

all: native

clean:
	$(OCB) -clean

native: depend
	$(OCB) Main.native

depend:
	ocamldep *.ml > .depend

include .depend
