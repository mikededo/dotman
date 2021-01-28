" Config
set nocompatible	" Be non-compatible with older versions
filetype off		" Plugin installation required

" Plugins
call plug#begin('~/.config/nvim/plugged')	" Plugin storage manager
	" UI	
	Plug 'joshdick/onedark.vim'		" Theme
	Plug 'scrooloose/nerdtree'		" File view
	Plug 'ryanoasis/vim-devicons'		" File view icons
	Plug 'mg979/vim-visual-multi', { 'branch': 'master' }	" Multi cursor
	Plug 'itchyny/lightline.vim'		" Bottom line

	" Files
	Plug 'junegunn/fzf', { 'do': './install --all' }
	Plug 'junegunn/fzf.vim'			" Open file integration [CTRL + P]

	" git
  	Plug 'editorconfig/editorconfig-vim'

	" Intelisense
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

" Plugins customizations
"   nerdtree
let g:NERDTreeShowHidden 	= 1
let g:NERDTreeMinimalUI 	= 1
let g:NERDTreeIgnore		= []
let g:NERDTreeStatusLine	= ''
"	fzf
let $FZF_DEFAULT_COMMAND	= 'ag -g ""'	" Ignore node_modules folder
"	coc
let g:coc_global_extensions	= [
	\ 'coc-emmet', 'coc-css', 'coc-html',
	\ 'coc-json', 'coc-prettier', 'coc-tsserver'
	\ ]

" Language specific settings
augroup webspecific
	au!	
  	" HTML
	autocmd FileType html setlocal shiftwidth=2 tabstop=2
  	" Javascript
  	autocmd FileType jsx setlocal shiftwidth=2 tabstop=2
  	autocmd FileType js setlocal shiftwidth=2 tabstop=2
  	autocmd FileType css setlocal shiftwidth=2 tabstop=2
augroup end

" UI
set smartindent
set number		      	" Display numbers 
set termguicolors	  	" Better colors
syntax on		        " Syntax highlighting
colorscheme onedark		" Theme
set guicursor=i:block-blinkwait200-blinkoff150-blinkon200

" lightline
if !has('gui_running')
	set t_Co=256
endif
let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ],
	\		  [ 'readonly', 'relativepath', 'modified' ] ]
	\ },
	\ 'inactive': {
	\	'left': [ [ 'relativepath' ] ]
	\ }
	\ }

" INFO
"
" Plugin installation
" 	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
