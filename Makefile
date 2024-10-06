main.saphe.lock.yaml: main.saphe.yaml
	saphe solve main.saty

main.tex: main.saty main.saphe.lock.yaml
	saphe build --text-mode latex -o $@ $<

document.pdf: document.tex main.tex
	ptex2pdf -l -u $<

.PHONY: clean
clean:
	rm -f *.satysfi-aux *.satysfi-deps.yaml *.aux *.bbl *.blg *.dvi *.log *.pdf *.toc *.out *.lof *.lot