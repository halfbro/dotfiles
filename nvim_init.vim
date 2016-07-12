" Use vim-plug to manage plugins easily
call plug#begin('~/.config/nvim/plugged')

" Plugins
Plug 'scrooloose/nerdtree' " File browser for projects in tree-form
	map <silent> <C-n> :NERDTreeToggle<CR> " Map Ctrl-n to toggle NERDTree

Plug 'scrooloose/syntastic' " Syntax-checking easy mode
Plug 'raimondi/delimitmate' " Delimit braces, etc. nicely

Plug 'pangloss/vim-javascript'

" General stuff
	filetype plugin on
	set hidden " Allows use of unsaved buffers basically
	set history=100

	set number
	set relativenumber

	map <leader>rr :source ~/.config/nvim/init.vim<cr>

	set backspace=indent,eol,start " Backspace over indents, eol, and over the start of inserts (places before the insert start)

	set cmdheight=1 " Set the command window to 1 line tall
	set showcmd " Show incomplete commands
	set confirm " Ask if files should be saved instead of failing

	set ruler " Show cursor position in bottom right 

" Color stuff
	syntax enable
	colorscheme industry

" Formatting stuff
	set autoindent " Keep indentation when making a new line in unrecognized languages
	set noexpandtab
	set shiftwidth=4
	set tabstop=4
	set nowrap " Don't wrap text, just trail the line off

" Searching stuff
	set hlsearch " Highlight searches
	set ignorecase " Ignore case
	set smartcase " ...Unless we use capitalized letters in the search

" Movement stuff
	set sidescroll=15 " Scroll by 15 characters when going to an edge
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

" Add plugins to &runtimepath
call plug#end()