
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


all: $(TARGET) display

doublemake: $(SOURCE_FILE) $(CHAP_FILES) makefile
	xelatex $<
	xelatex $<

%.pdf: $(SOURCE_FILE) $(CHAP_FILES) makefile
	xelatex $<

Chap_%.tex: %/*.tex
	cat $^ > $@


rtf:
	latex2rtf -C utf8 technotes

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



