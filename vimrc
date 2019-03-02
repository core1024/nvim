scriptencoding utf-8
set encoding=utf-8

set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*/node_modules/*,*/bower_components/*,*/.git/*

"pacman -S editorconfig-core-c
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

execute pathogen#infect()

" Airline settings
let g:airline_theme='aurora'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
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
set bg=dark
"colorscheme monokai

colorscheme lucius

set sessionoptions-=options
set spell spelllang=en_us
set mouse=n
set tabstop=4
set shiftwidth=4
set autoindent
set number "Show line numbers
set relativenumber " Show line numbers relative to cursor
set cursorline "Mark the line with the cursor
set linebreak "Wrap on whole words
set nolist "hide symbols for unprintable characters
set hidden "enable switching from unsaved buffer
set incsearch "search as you type
set hlsearch
set smartcase
set undofile
set undodir=~/.vim/undodir
set wildmenu
set path+=**
"hi MatchParen ctermfg=208 ctermbg=bg

"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif

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
set clipboard=unnamedplus
"set clipboard=unnamed

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

