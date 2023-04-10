# Minimal makefile for Sphinx documentation
#
# Also includes a target 'doxygen' to generate API documentation

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS       ?=
SPHINXBUILD      ?= sphinx-build
SOURCEDIR        = ./
BUILDDIR         = .doxygen/tmp

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile doxygen clean_doxygen

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

doxygen:
	rm -rf $(BUILDDIR)
	mkdir -p $(BUILDDIR)
	cp ../lib/hipfort/*.f $(BUILDDIR)
	bash clean-module-files.sh $(BUILDDIR)
	( cat Doxyfile ;\
	    echo "OUTPUT_DIRECTORY = $(BUILDDIR)";\
	    echo "INPUT = $(BUILDDIR)" ) | doxygen -
	
clean_doxygen:
	rm -rf $(BUILDDIR)
