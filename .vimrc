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
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'moll/vim-bbye'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

set t_Co=256
colorscheme PaperColor
" dark mode support
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
   set background=dark
else
  set background=light
endif

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
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
      \   'gitbranch': 'FugitiveStatusline'
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
      \'coc-tailwind-intellisense',
      \'coc-prettier',
      \'coc-svg',
      \ ]


" commands
command! VimRCLoad source $MYVIMRC
command! VimRC edit $MYVIMRC
command! SessMake mksession! .session.vim
command! SessLoad source .session.vim
command! ThemeLight set background=light
command! ThemeDark set background=dark

" shortcuts
let mapleader = " "

" window management
map <leader>\ :vsp<Cr>

" pane navigation
map <leader>q :close<Cr>
map <leader>Q :qa!<Cr>
" file nav
map <leader>b :Buffers<Cr>
map <leader>f :Files<Cr>
map <leader>e :CocCommand explorer<Cr>
map <Leader>r :CocList outline<Cr> 

" buffer control
map gq :Bdelete<Cr>
map gp :bprevious<Cr>
map gn :bnext<Cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" misc
map <leader>s :mksession! .session.vim<Cr>
map <leader>t :enew<Cr>
map <leader>z :Goyo x50%-25%<Cr>
map <leader>Z :Goyo!<Cr>
