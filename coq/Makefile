COQC = coqc
COQFLAGS = -Q . YXTT

FILES = Laws.v T64.v FermionGenerations.v ThreeGenerations.v

all: $(FILES:.v=.vo)

%.vo: %.v
	$(COQC) $(COQFLAGS) $<

clean:
	rm -f *.vo *.glob *.v~ *.aux

.PHONY: all clean
