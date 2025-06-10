MAIN := main.pdf
CHAPS := $(wildcard chap*.typ)

all: $(MAIN)

$(MAIN): main.typ $(CHAPS)
	typst compile main.typ

clean:
	rm -f $(MAIN)
