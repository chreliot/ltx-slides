# Reusable Makefile for ltx-talk projects

SOURCES := $(filter-out %-handout.tex,$(wildcard *.tex))

ifeq ($(words $(SOURCES)),0)
$(error No .tex source file found)
endif

ifneq ($(words $(SOURCES)),1)
$(error Expected exactly one primary .tex source file; found: $(SOURCES))
endif

SOURCE   := $(SOURCES)
BASENAME := $(basename $(SOURCE))
HANDOUT  := $(BASENAME)-handout
WRAPPER  := $(HANDOUT).tex

.PHONY: all clean preview FORCE

all: $(BASENAME).pdf $(HANDOUT).pdf

# Normal presentation
$(BASENAME).pdf: FORCE
	latexmk -pv- $(SOURCE)

# Generate the handout wrapper
$(WRAPPER): $(SOURCE)
	printf '%s\n' '\PassOptionsToClass{mode=handout}{ltx-talk}' \
				  '\input{$(SOURCE)}' > $(WRAPPER)

# Handout version
$(HANDOUT).pdf: $(WRAPPER) FORCE
	latexmk -pv- $(WRAPPER)

# Build/open the normal presentation
preview:
	latexmk -pv $(SOURCE)

# Remove generated files for both versions
clean:
	latexmk -C $(SOURCE)
	latexmk -C $(WRAPPER)
	rm -f $(WRAPPER)

FORCE: