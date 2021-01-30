" Config
set nocompatible	" Be non-compatible with older versions
filetype off			" Plugin installation required

" Plugins
call plug#begin('~/.config/nvim/plugged')	" Plugin storage manager
	" UI	
	Plug 'joshdick/onedark.vim'			" Theme
	Plug 'scrooloose/nerdtree'			" File view
	Plug 'tiagofumo/vim-nerdtree-syntax-highlighting'
	Plug 'ryanoasis/vim-devicons'		" File view icons
	Plug 'mg979/vim-visual-multi', { 'branch': 'master' }	" Multi cursor
	Plug 'itchyny/lightline.vim'		" Bottom line

	" Files
	Plug 'junegunn/fzf', { 'do': './install --all' }
	Plug 'junegunn/fzf.vim'					" Open file integration [CTRL + P]

	" git
 	Plug 'editorconfig/editorconfig-vim'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Intelisense
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

" Plugins customizations
"   nerdtree
let g:NERDTreeShowHidden 	= 1
let g:NERDTreeMinimalUI 	= 1
let g:NERDTreeIgnore		= ['^node_modules']
let g:NERDTreeStatusLine	= ''
"	fzf
let $FZF_DEFAULT_COMMAND	= 'ag -g ""'	" Ignore node_modules folder
"	coc
let g:coc_global_extensions	= [
	\ 'coc-emmet',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-eslint',
	\ 'coc-json',
	\ 'coc-prettier',
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ ]
set updatetime=300

" File specific settings
augroup langspec
	au!	
	" HTML
	autocmd FileType html setlocal shiftwidth=2 tabstop=2
	" Javascript
	autocmd FileType jsx setlocal shiftwidth=2 tabstop=2
	autocmd FileType js setlocal shiftwidth=2 tabstop=2
	autocmd FileType css setlocal shiftwidth=2 tabstop=2
	" Other
	autocmd FileType vim setlocal shiftwidth=2 tabstop=2	
	autocmd FileType zsh setlocal shiftwidth=2 tabstop=2	
	autocmd FileType sh setlocal shiftwidth=2 tabstop=2	
augroup end

" Key mapping
" <c-space> to trigger autocompletion
inoremap <silent><expr> <c-space> coc#refresh()
" <tab> to trigger autocompletion - ensure no other extension makes use of
" tab
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Code navigation (go to <file>...)
nmap <silet> gd <Plug>(coc-definition)
nmap <silet> gy <Plug>(coc-type-definition)
nmap <silet> gi <Plug>(coc-implementation)
nmap <silet> gr <Plug>(coc-references)
" Rename current symbol
nmap <F2> <Plug>(coc-rename)
" Formatting selected code
nmap <leader>f <Plug>(coc-format-selected)
xmap <leader>f <Plug>(coc-format-selected)
" Toggle NERDTree
nmap <C-b> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
" NERDTree colors
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
	\ "Staged"    : "#0ee375",  
	\ "Modified"  : "#d9bf91",  
	\ "Renamed"   : "#51C9FC",  
	\ "Untracked" : "#FCE77C",  
	\ "Unmerged"  : "#FC51E6",  
	\ "Dirty"     : "#FFBD61",  
	\ "Clean"     : "#87939A",   
	\ "Ignored"   : "#808080"   
\ }

" Prettify on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" UI
set smartindent
set smarttab
set number		      	" Display numbers 
set termguicolors	  	" Better colors
syntax on		        	" Syntax highlighting
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
