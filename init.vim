scriptencoding utf-8
set encoding=utf-8

set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*/node_modules/*,*/bower_components/*,*/.git/*

execute pathogen#infect()

" Airline settings
let g:airline_theme='aurora'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

filetype on
syntax on
colorscheme material-monokai
set mouse=n
set tabstop=4
set shiftwidth=4
set autoindent
set number "Show line numbers
set relativenumber " Show line numbers relative to cursor
set cursorline "Mark the line with the cursor
set nolist "hide symbols for unprintable characters
set hidden "enable switching from unsaved buffer
set incsearch "search as you type
set hlsearch
set smartcase
set undofile
set undodir=~/.vim/undodir
set wildmenu
set path+=**

nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>
nmap <Leader><Tab> :Buffers<CR>
nmap <Leader>t :TagbarToggle<CR>
nmap <silent> <Tab> :bnext<CR>
nmap <silent> <S-Tab> :bprevious<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

augroup vimrc     " Source vim configuration upon save
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nmap <C-L> :let @/=""<CR>

" Paste, Cut, Copy into system clipboard
map! <S-Insert> <C-R>+
nmap <S-Insert> "+P
vmap <S-Del> "+d
vmap <C-Insert> "+y

