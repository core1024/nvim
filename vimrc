scriptencoding utf-8
set encoding=utf-8

" Plugin settings

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'Markdown',
    \ 'kinds' : [
        \ 'c:Heading_L1',
        \ 's:Heading_L2',
        \ 'S:Heading_L3',
        \ 't:Heading_L4',
        \ 'T:Heading_L5'
    \ ]
\ }

"pacman -S editorconfig-core-c
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Airline settings
let g:airline_theme='aurora'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>
nmap <Leader><Tab> :Buffers<CR>
nmap <Leader>t :TagbarToggle<CR>

" Vim settings
colorscheme lucius

set bg=dark
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
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*/node_modules/*,*/bower_components/*,*/.git/*

" Paste, Cut, Copy into system clipboard
set clipboard=unnamed

"hi MatchParen ctermfg=208 ctermbg=bg

nmap <silent> <Tab> :bnext<CR>
nmap <silent> <S-Tab> :bprevious<CR>
nmap <C-L> :let @/=""<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

augroup vimrc     " Source vim configuration upon save
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
augroup END


function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

filetype on
syntax on

