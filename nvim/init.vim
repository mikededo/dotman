" Config
set nocompatible	" Be non-compatible with older versions
filetype off		" Plugin installation required

" Plugins
call plug#begin('~/.config/nvim/plugged')	" Plugin storage manager
	Plug 'joshdick/onedark.vim'		" Theme
	Plug 'scrooloose/nerdtree'		" File view
	Plug 'ryanoasis/vim-devicons'		" File view icons

	Plug 'junengunn/fzf', {	'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'			" Open file integration [CTRL + P]

	" Intelisense
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

" Plugins customizations
" 	nerdtree
let g:NERDTreeShowHidden 	= 1
let g:NERDTreeMinimalUI 	= 1
let g:NERDTreeIgnore		= []
let g:NERDTreeStatusLine	= ''
"	fzf
let $FZF_DEFAULT_COMMAND	= 'ag -g ""'	" Ignore node_modules folder
"	coc
let g:coc_global_extensions	= [ 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver' ]

" UI
set number		" Display numbers 
set termguicolors	" Better colors
syntax on		" Syntax highlighting
colorscheme onedark	" Theme
set guicursor=i:block-blinkwait200-blinkoff150-blinkon200


" INFO
"
" Plugin installation
" 	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
