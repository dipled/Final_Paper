FLAGS  = -f -pdf -quiet -pv
CLEANFLAG = -c
TARGET = Main.tex
EXTRACLEAN = *.maf *.mtc* *.tdo *.nls *.nlo *.brf

all: 
	latexmk ${FLAGS} ${TARGET}

cleanall: changevar clean

changevar:
	$(eval CLEANFLAG=-C -bibtex)

clean:
	latexmk ${CLEANFLAG}; rm ${EXTRACLEAN}; cd PreTextuais/; latexmk ${CLEANFLAG}; cd ../PosTextuais/; latexmk ${CLEANFLAG}; cd ../Textuais/; latexmk ${CLEANFLAG}; cd ..
