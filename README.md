# ltx-slides

Template for LuaLaTeX slides using the [`ltx-talk`](https://ctan.org/pkg/ltx-talk) class, for [tagged, accessible, PDF/UA-2-conforming](https://latex3.github.io/tagging-project/documentation/) output.

## usage

If using the GitHub CLI `gh`, I clone the template with: 
```
gh repo create <new-local-name> -c --private --template ltx-slides
```
where `<new-local-name>` is the name of the slide deck.

I typeset with 
```
latexmk -pv -lualatex *.tex
```
though the template repo now includes a `.latexmkrc` file, such that no options are required.