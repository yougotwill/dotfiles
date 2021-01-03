set title " terminal title
set hidden " hides buffer when it is abandoned
set number " shows line numbers
set ignorecase " ignores case in search
set tabstop=2 shiftwidth=2 expandtab " makes tabs 2 spaces
set cursorline " highlights line with cursor on
set termguicolors " terminal TrueColor support
set mouse=a " allows mouse in all modes
set noshowmode " hide mode status line for lightline
set ve+=onemore " puts cursor on empty space at EoL
set ai " auto indentation
set showtabline=2 " forces the tabline to always show
set splitright " vertical split goes to the right

call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/vim-gitbranch'
Plug 'moll/vim-bbye'
Plug 'sickill/vim-monokai'
Plug 'Lokaltog/vim-monotone'
Plug 'rakr/vim-one'
call plug#end()

" dark theme
set background=dark
colorscheme monokai

" light theme
" set background=light
" colorscheme one


let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
let g:lightline#bufferline#clickable=1
let g:lightline.component_raw = {'buffers': 1}

let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-tsserver',
      \'coc-json',
      \'coc-html',
      \'coc-css',
      \ ]

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" commands
command! VimRCLoad source $MYVIMRC
command! VimRC edit $MYVIMRC
command! SessMake mksession! .session.vim
command! SessLoad source .session.vim
command! ColorsOn :colorscheme monokai
command! ColorsOff :colorscheme monotone

" shortcuts
let mapleader = " "

" window management
map <leader>/ :vsp<Cr>

" pane navigation
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" file nav
map <leader>b :Buffers<Cr>
map <leader>f :Files<Cr>
map <leader>e :CocCommand explorer<Cr>
map <leader>E :CocCommand explorer --focus --no-toggle<Cr>

" buffer control
map gq :Bdelete<Cr>
map gp :bprevious<Cr>
map gn :bnext<Cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" misc
map <leader>s :mksession! .session.vim<Cr>
map <leader>t :enew<Cr>
