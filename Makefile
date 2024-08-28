FLAGS  = -f -pdf -pv
CLEANFLAG = -c
TARGET = Main.tex

all: 
	latexmk ${FLAGS} ${TARGET}

cleanall: changevar clean

changevar:
	$(eval CLEANFLAG=-C -bibtex)

clean:
	latexmk ${CLEANFLAG}; cd PreTextuais/; latexmk ${CLEANFLAG}; cd ../PosTextuais/; latexmk ${CLEANFLAG}; cd ../Textuais/; latexmk ${CLEANFLAG}; cd ..
