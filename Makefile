# Laurence Kedward 2021
# Licensed for use under the MIT License (see LICENSE file)

SHELL=/bin/bash
SRC=tex/paper.tex

all:
	rubber --pdf --into tex $(SRC)

clean:
	rubber --clean	--into tex $(SRC)

count:
	texcount $(SRC)	

diff: DIFF_FILE_CMD=$(shell latexdiff-vc tex/paper.tex -r origin/main --force|grep Generated|cut -d\  -f4)

diff:
	rubber --pdf --into tex $(DIFF_FILE_CMD)
	rubber --clean --into tex $(DIFF_FILE_CMD)

spellcheck: $(SRC).txt
	codespell -I dictionary.txt $(SRC).txt

count2: $(SRC).txt
	wc -w $^

%.txt: %
	textidote --clean $^ > $@

.PHONY: all clean count diff spellcheck 
