
TARGET = technotes.pdf

CHAPTERS = \
Algorithm \
CProgram \
CodingTools \
DataBases \
GeneralDesktop \
Hardwares \
LatexSkills \
LinuxDesktop \
LinuxServer \
NetworkBasics \
ProgramMethod \
Python \
RSPE \
ShellPrograms \
SystemPlatforms \
WindowsPC \

CHAP_FILES = $(CHAPTERS:%=Chap_%.tex)

BACKUP_DIR = /media/D/Yunio
SOURCE_FILE = technotes.tex

.PHONY: backup
.PHONY: display 


all: $(TARGET) backup display

%.pdf: $(SOURCE_FILE) $(CHAP_FILES) makefile
	xelatex $<
	xelatex $<
	#latex2rtf -C utf8 technotes
	cp $@ ~

Chap_%.tex: %/*.tex
	cat $^ > $@


touch:
	touch $(SOURCE_FILE)

clean:
	rm -f *.out *.aux *.log *.pdf *.toc

backup:
	if [ `dirname ${PWD}` != $(BACKUP_DIR) ]; \
	then \
	    rsync -av `pwd` /media/D/Yunio; \
	fi

display:
	evince $(TARGET) &



