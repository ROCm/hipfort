# Minimal makefile for Sphinx documentation
#
# Also includes a target 'doxygen' to generate API documentation

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS       ?=
SPHINXBUILD      ?= sphinx-build
SOURCEDIR        = source
BUILDDIR         = build

DOXYGEN_BUILDDIR = $(BUILDDIR)/doxygen

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile doxygen clean_doxygen

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

doxygen:
	mkdir -p $(DOXYGEN_BUILDDIR)
	rm -rf $(DOXYGEN_BUILDDIR)/html
	rm -rf $(DOXYGEN_BUILDDIR)/latex
	mkdir -p $(DOXYGEN_BUILDDIR)/tmp
	cp ../lib/hipfort/*.f $(DOXYGEN_BUILDDIR)/tmp
	bash clean-module-files.sh $(DOXYGEN_BUILDDIR)/tmp
	( cat Doxyfile ;\
	    echo "OUTPUT_DIRECTORY = $(DOXYGEN_BUILDDIR)";\
	    echo "INPUT = $(DOXYGEN_BUILDDIR)/tmp" ) | doxygen -
	rm -rf $(DOXYGEN_BUILDDIR)/tmp

clean_doxygen:
	rm -rf $(DOXYGEN_BUILDDIR)
