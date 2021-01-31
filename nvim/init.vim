" Config
set nocompatible	" Be non-compatible with older versions
filetype off			" Plugin installation required
set smartindent
set smarttab
set expandtab
set noshowmode 							" Hide mode from bottom line
set number relativenumber 	" Display numbers 
set termguicolors	  				" Better colors
set guicursor= 							" Keep cursor as a block
set hidden 	 								" Keep unsaved files in the background
set incsearch               " Highlight as searching
set scrolloff=12
set noswapfile              " No swap file
set undodir=~/.vim/undodir
set undofile
set textwidth=80
set foldcolumn=1
set ignorecase              " Ignore case on search
set smartcase               " Not if there's a capital letter
syntax on		        				" Syntax highlighting
filetype plugin indent on
set ruler

" CONFIG: Refresh file on focus
au FocusGained,BufEnter * :checktime

" CONFIG: Show help vertical
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" CONFIG: Format options
set formatoptions+=t
set formatoptions+=c
set formatoptions-=a
set formatoptions+=j
set formatoptions+=r
set formatoptions-=o

" Plugins
" Plugins to install once nvim 0.5 is stable:
"    - TreeSitter
"    - Telescope
call plug#begin('~/.config/nvim/plugged')	" Plugin storage manager
	" UI	
	Plug 'joshdick/onedark.vim'			" Theme
	Plug 'scrooloose/nerdtree'			" File view
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'		" File view icons
	Plug 'mg979/vim-visual-multi', { 'branch': 'master' }	" Multi cursor
	Plug 'itchyny/lightline.vim'		" Bottom line
	" Syntax highlighting
	Plug 'kevinoid/vim-jsonc' 			" JSONComments sh
  Plug 'maxmellon/vim-jsx-pretty' " React sh
	Plug 'pangloss/vim-javascript' 	" JS sh

	" Files
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'					" Open file integration [CTRL + P]

	" git
 	Plug 'editorconfig/editorconfig-vim'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Intelisense
  Plug 'neoclide/coc.nvim', { 'branch': 'release' } 
  Plug 'mattn/emmet-vim'

	" Other
	Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'
call plug#end()

colorscheme onedark					" Set theme

" Plugins customizations
" PLUGIN CONFIG: NERDtree
let g:NERDTreeShowHidden 	= 1
let g:NERDTreeIgnore		  = ['^node_modules']
let g:NERDTreeStatusLine	= ''

" PLUGIN CONFIG: fzf
let g:fzf_layout = { 'down': '30%' }

" PLUGIN CONFIG:	NERDTree colors
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

"	PLUGIN CONFIG:	coc
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

" PLUGIN CONFIG:	lightline
if !has('gui_running')
	set t_Co=256
endif
let g:lightline = {
		\ 'colorscheme': 'one',
		\ 'active': {
		\	'left': [ [ 'mode', 'paste' ],
		\		        [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
		\ },
		\ 'inactive': {
		\	'left': [ [ 'relativepath' ] ]
		\ }
	\ }

" PLUGIN CONFIG:	NERDCommenter
let g:NERDCreateDefaultMappings = 1 	" Use default mappins (see docs)
let g:NERDSpaceDelims = 1 						" Add space end of comment
let g:NERDCompactSexyComs = 1 				" Comptact syntax for prettified ml comments
let g:NERDDefaultAlign = 'left' 			" Align line-wise

" FILETYPE: File specific settings
augroup langspec
	au!	
	autocmd FileType html setlocal shiftwidth=2 tabstop=2
	autocmd FileType css setlocal shiftwidth=2 tabstop=2
	" Javascript
	autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
	autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
	autocmd FileType json setlocal shiftwidth=2 tabstop=2
	autocmd FileType jsonc setlocal shiftwidth=2 tabstop=2
	" Other
	autocmd FileType vim setlocal shiftwidth=2 tabstop=2	
	autocmd FileType zsh setlocal shiftwidth=2 tabstop=2	
	autocmd FileType sh setlocal shiftwidth=2 tabstop=2	
augroup end

" Key mapping
" KEYMAP: Change leader key
let mapleader=","

" KEYMAP: Save on exit insert mode
inoremap <ESC> <ESC>:w<CR>

" KEYMAP: Switch/Toggle buffers
nnoremap <BS> <C-^>

" KEYMAP: <c-space> to trigger autocompletion
inoremap <silent><expr> <C-Space> coc#refresh()

" KEYMAP:	<C-s> to save
nnoremap <C-s> :update<CR> 
vnoremap <C-s> <ESC>:update<CR>v
inoremap <C-s> <ESC>:update<CR>i

" KEYMAP: <C-a> to select word
nnoremap <C-a> viw

"	KEYMAP: Change windows
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" KEYMAP: <C-Enter> for a new line and enter insert mode
nnoremap <Leader><CR> o

" KEYMAP: Insert empty line in NORMAL mode
" <Alt-k> => Insert above
" <Alt-j> => Insert below
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>

" KEYMAP: Remove empty line in NORMAL mode
" <Alt-k> => Delete above
" <Alt-j> => Delete below
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>

" KEYMAP: Move lines up-down
nnoremap <silent><A-S-k> :m .-2<CR>==
nnoremap <silent><A-S-j> :m .+1<CR>==
inoremap <silent><A-S-k> <ESC>:m .-2<CR>==gi
inoremap <silent><A-S-j> <ESC>:m .+1<CR>==gi
vnoremap <silent><A-S-k> :m '>-2<CR>gv=gv
vnoremap <silent><A-S-j> :m '>+1<CR>gv=gv

" KEYMAP: Open/delete and navigate through tabs
nnoremap <Leader><k> :tabnext<CR>
nnoremap <Leader><j> :tabprev<CR>
nnoremap <Leader><l> :tablast<CR>
nnoremap <Leader><h> :tabfirst<CR>
nnoremap <Leader><w> :tabclose<CR>
nnoremap <Leader><t> :tabnew<CR>

" KEYMAP: Increment-decrement split size
nnoremap <silent><Leader>+ 20<C-w>> 
nnoremap <silent><Leader>- 20<C-w><

" KEYMAP: <tab> to trigger autocompletion - ensure no other extension makes use of
"	tab
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"	KEYMAP: Code navigation (go to <file>...)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" KEYMAP: Rename current symbol
nmap <F2> <Plug>(coc-rename)

" KEYMAP: Formatting selected code
nmap <Leader>f <Plug>(coc-format-selected)
xmap <Leader>f <Plug>(coc-format-selected)
" KEYMAP:   Clear search
nnoremap <ESC><ESC> :noh<CR>

" KEYMAP: Toggle NERDTree
nmap <C-b> :NERDTreeToggle<CR>

" KEYMAP: NERDCommenter
nmap <Leader>cc <Plug>NERDCommenterToggle
nmap <Leader>c<space> <Plug>NERDCommenterCommentt

" KEYMAP: fzf
nmap <C-P> :FZF<CR>

" Prettify on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

  
" INFO
" 
" Plugin installation
" 	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
