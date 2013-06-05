all: workflow.pdf

%.pdf : %.tex
	xelatex $<
	evince $@
