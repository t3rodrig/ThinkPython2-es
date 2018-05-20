exec = pandoc
execopt = -V geometry:"width=5.5in,height=8.5in,hmarginratio=3:2,vmarginratio=1:1"

# source and target files
SRC_FILES = $(wildcard markdown/*.md)
TGT_FILES = $(patsubst markdown/%.md, PDF/%.pdf, $(SRC_FILES))

.PHONY : all
all : $(TGT_FILES)

PDF/%.pdf: markdown/%.md
	$(exec) $(execopt) -o $@ $<

## variables : Print variables
.PHONY: variables
variables:
	@echo SRC_FILES: $(SRC_FILES)
	@echo TGT_FILES: $(TGT_FILES)
