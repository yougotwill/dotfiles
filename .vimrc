" Vim Config
" By William Grant
" 2024/07/03

if exists('g:vscode')
else
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

    " netrw
    let g:netrw_liststyle = 3 " directory liststyle
    let g:netrw_banner = 0 " hide banner
    let g:netrw_browse_split = 4 " open file in previous window
    let g:netrw_winsize = 30 " width of 30%
    let g:netrw_fastbrowse = 0 " closes netrw buffer if it's already open 
    " (slow performance)
    " let g:netrw_list_hide = netrw_gitignore#Hide() " .gitignore support

    " statusline
    set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P " statusline with ruler set + git branch

    " Navigation
    map <leader>e :Lexplore<cr>
    map <leader>p :Files<cr>
    map <leader>f :GFiles<cr>
    map <leader>t :Ag!<cr>
    map <leader>r :BTags<cr>
    map <leader>b :Buffers<cr>

    " Buffers
    map gn :bnext<cr>
    map gm :bprevious<cr>
    map gs :write<cr>
    " Refresh buffer discarding any unsaved changes
    map g<space> :e!<cr>
    " Close the current buffer
    map gw :bdelete<cr>
    " Close all the buffers
    map gq :q<cr>

    " Session
    map gs :SessMake<cr>
    map gS: SessLoad<cr>

endif

set title " terminal title
set hidden " hides buffer when it is abandoned
set number " shows line numbers
set laststatus=2 " always show the status line

set mouse=a " allows mouse in all modes
set ai " auto indentation
set showtabline=2 " forces the tabline to always show
set splitright " vertical split goes to the right

" Search
set ignorecase " ignores case when searching
set incsearch " shows results as you type
set hlsearch " search matches are highlighted
set smartcase " search cases intelligently

" Whitespace 
set tabstop=2
set shiftwidth=2
set expandtab " use spaces instead of tabs
" set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~ " Visualise tabs and new lines
" set list



" use system clipboard
if has("clipboard")
  if has("unnamedplus")
    " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else
    " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" GUI
set cursorline " highlights line with cursor on
set termguicolors " terminal TrueColor support
set t_Co=256
colorscheme codedark

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
map <leader>c :noh<cr>

" Windows
map <leader><Bslash> :vsp<cr>
