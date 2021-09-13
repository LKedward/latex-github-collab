# Collaborative LaTeX Writing using Git and Github Actions

[![CI](https://github.com/LKedward/latex-github-collab/actions/workflows/CI.yml/badge.svg)](https://github.com/LKedward/latex-github-collab/actions/workflows/CI.yml) [[__View Paper Preview__](https://github.com/LKedward/latex-github-collab/blob/previews/master/paper.pdf)]

A Github repository template for writing LaTeX documents collaboratively with automatic rendering using Github actions.

- Renders the paper on every push to master
- Renders the paper for pull requests, including latex-diff with master
- Calculates document word count for pull requests using texcount

## Compiling Locally

Compiling locally is possible with any LaTeX distribution; the github actions [workflow](https://github.com/LKedward/latex-github-collab/blob/master/.github/workflows/CI.yml) (Ubuntu 20.04) uses the following packages (all installable via `apt`):

- `texlive-latex-recommended`
- `texlive-latex-extra`
- `texlive-extra-utils` (_optional:_ needed for `texcount`)
- [`rubber`](https://gitlab.com/latex-rubber/rubber/) (_optional:_ needed for Makefile usage)
- `perl` (_optional:_ needed for texcount and latexdiff)
- `latexdiff`(_optional_)

For running the spellcheck, the following packages are required:

- [`textidote`](https://github.com/sylvainhalle/textidote/releases/tag/v0.8.2) (for generating plain-text from tex)
- `codespell` (installable with `pip3`)

For convenience a Makefile is included which relies on the [rubber](https://gitlab.com/latex-rubber/rubber/) LaTeX wrapper:

```
$ make             # generate paper.pdf
$ make clean       # cleanup
$ make spellcheck  # run codespell
$ make count       # run TexCount
$ make diff        # run latexdiff with master
```

