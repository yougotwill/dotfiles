" Vim Config
" By William Grant
" 2024/01/20

" Initialise plugins
" Automatically executes `filetype plugin indent on` and `syntax enable`
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arzg/vim-colors-xcode'
Plug 'tomasiser/vim-code-dark'
call plug#end()

set title " terminal title
set hidden " hides buffer when it is abandoned
set number " shows line numbers
set laststatus=2 " always show the status line

" Search
set ignorecase " ignores case when searching
set incsearch " shows results as you type
set hlsearch " search matches are highlighted
set smartcase "search cases intelligently

" makes tabs 2 spaces
set tabstop=2
set shiftwidth=2

set expandtab " use spaces instead of tabs

set mouse=a " allows mouse in all modes
set ai " auto indentation
set showtabline=2 " forces the tabline to always show
set splitright " vertical split goes to the right
set listchars=tab:▸\ ,eol:¬ " Visualise tabs and new lines

" netrw
let g:netrw_liststyle = 3 " directory liststyle
let g:netrw_banner = 0 " hide banner
let g:netrw_browse_split = 4 " open file in previous window
let g:netrw_winsize = 30 " width of 30%
let g:netrw_fastbrowse = 0 " closes netrw buffer if it's already open 
" (slow performance)
" let g:netrw_list_hide = netrw_gitignore#Hide() " .gitignore support

" GUI
set cursorline " highlights line with cursor on
set termguicolors " terminal TrueColor support
set t_Co=256
colorscheme codedark

" statusline
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P " statusline with ruler set + git branch

" Dark mode support
if system("defaults read -g AppleInterfaceStyle") =~? '^Dark'
set background=dark
colorscheme codedark
else
set background=light
colorscheme PaperColor
endif

" commands
command! VimRCLoad source $MYVIMRC
command! VimRC edit $MYVIMRC
command! SessMake mksession! ~/.session.vim
command! SessLoad source  ~/.session.vim
command! ThemeLight set background=light
command! ThemeDark set background=dark

" Shortcuts (leader is \ by default)
let mapleader = " "
map <leader><leader> :noh<cr>

" Navigation
map <leader>e :Lexplore<cr>
map <leader>p :Files<cr>
map <leader>f :GFiles<cr>
map <leader>t :Ag!<cr>
map <leader>r :BTags<cr>
map <leader>b :Buffers<cr>

map gs :SessMake<cr>
map gS: SessLoad<cr>

" Buffers
" Save buffer
map gs :write<cr>

" Close the current buffer
map gw :bd<cr>

" Close all the buffers
map gq :wq<cr>

map gn :bnext<cr>
map gb :bprevious<cr>

" start vim in insert mode
" autocmd BufRead,BufNewFile * start
