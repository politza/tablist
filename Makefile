EMACS ?= emacs
# Handle the mess when inside Emacs.
unexport INSIDE_EMACS		#cask not like this.
ifeq ($(EMACS), t)
EMACS = emacs
endif

emacs = $(EMACS)

all: package

byte-compile:
	cask exec $(emacs) --batch -L lisp -f batch-byte-compile *.el

package:
	cask package
clean:
	rm -rf dist
	rm -f -- *.elc
