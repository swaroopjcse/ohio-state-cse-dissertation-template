### WHAT YOU NEED IN ORDER TO USE "OSUDISSERT96"
(the 1996 Graduate School Dissertation/Thesis format)

To use the osudissert style, you will need to have
1. LaTeX2e (obviously).
2. osudissert96.cls

### File structure

The template is organized in the following file structure:

./ (root directory)
|- README.md (This file)
|- osudissert96.cls
|- osudissert96-mods.sty
|- Makefile
|- ref.bib (sample bibliography database)
|- config:  (contains the configuration files)
|  |- preamble.tex        (contains the packages, etc.)
|  |- proposal-macros.tex (contains some macros for color, etc.)
|
|- img:     (contains the image files, currently empty)
|
|- tex:     (contains the tex source)
   |- abstract.tex
   |- vita.tex
   |- ack.tex
   |- 1.introduction.tex
   |- 2.background.tex
   |- 3.contribution.tex
   |- 4.conclusion.tex

### Compiling the project

To fully compile this example, it should suffice to run `$ make`.

If you do not have some tools used in `Makefile` or you have to compile manually for some other reaons, you should do the following:

1. In the root directory, run LaTeX (or pdflatex) on main. This will do the inital compilation of the document and will create a list of the labels and references made. (`$ pdflatex main`)
2. Run BibTeX on main. This will go into bibfile.bib and extract the appropriate bibliography for the references cited in the dissertation. (`$ bibtex main`)
3. Run LaTeX on main two more times. The first time, LaTeX will go through and (at the end) will recognize the references made in the citations and will set up the table of contents.  However, the table of contents will probably be off since the table of contents will grow. The second time through, LaTeX will get the page numbers correct in the table of contents. (`$ pdflatex main; pdflatex main`)
