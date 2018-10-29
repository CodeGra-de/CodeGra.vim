# CodeGra.vim

*The* Vim plugin for CodeGra.de

## Installation

#### Dependencies

Make sure [CodeGra.fs](https://github.com/CodeGra-de/CodeGra.fs) is installed
and both `cgfs` and the helper program `cgapi-consumer` must be available from
the user's `PATH` environment variable.

#### Vim 8 and up

```sh
mkdir ~/.vim/pack/CodeGrade/start
git clone https://github.com/CodeGra-de/CodeGra.vim ~/.vim/pack/CodeGrade/start
```

#### Up to Vim 8

Use your package manager of choice, below examples for few popular ones.

```vim
" vim-plug
call plug#begin()
Plug 'CodeGra-de/CodeGra.vim'
call plug#end()

" Vundle
call vundle#begin()
Plugin 'CodeGra-de/CodeGra.vim'
call vundle#end()
filetype plugin on

" minpac
call minpac#init()
call minpac#add('CodeGra-de/CodeGra.vim')
```

## Usage

Mount your CodeGra.de account to a directory and open a file in one
of the filesystem's subdirectories:

```sh
$ cgfs ~/CodeGra.de
Mounting...
Mounted
$ vim ~/CodeGra.de/<course>/<assignment>/<submission>
```

The following commands are available in Vim:

| Command | `--fixed`<a href="#footnote-1-b"><sup id="footnote-1-a">1</sup></a> | Description |
|---|---|---|
| CGEditFeedback | ✓ | Edit the current submission's global feedback. |
| CGEditGrade | ✓ | Edit the current submission's grade. |
| CGShowLineFeedback | ✗ | Show the line-feedback for the current buffer in the quickfix list and open the quickfix window. |
| CGEditLineFeedback | ✓ | Edit the comment for the current line in the current buffer. |
| CGDeleteLineFeedback | ✓ | Delete the comment for the current line in the
current buffer. |
| CGOpenRubricEditor | ✗ | Edit the rubric of the assignment of the current
file. |
| CGOpenRubricSelector | ✓ | Open the rubric for the current submission. |
| CGRubricPrevSection | ✗ | Go to the previous header in a rubric file. |
| CGRubricNextSection | ✗ | Go to the next header in a rubric file. |
| CGRubricSelectItem | ✓ | Select the rubric item on the current line. |

<a href="#footnote-1-a"><sup id="footnote-1-b">1</sup></a>: Require the filesystem to be mounted with the `--fixed` flag to use this feature.

## License

CodeGra.vim is released under [LICENSE](AGPL-v3.0).
