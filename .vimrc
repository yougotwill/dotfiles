set title " terminal title
set hidden " hides buffer when it is abandoned
set number " shows line numbers
set ignorecase " ignores case in search
set tabstop=2 shiftwidth=2 expandtab " makes tabs 2 spaces
set cursorline " highlights line with cursor on
set termguicolors " terminal TrueColor support
set mouse=a " allows mouse in all modes
set noshowmode "hide mode status line for lightline

call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'sickill/vim-monokai'
Plug 'Lokaltog/vim-monotone'
Plug 'joshdick/onedark.vim'
call plug#end()

colorscheme monokai 

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

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

" saves and restores code folds
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent! loadview

command! ConfigRefresh source $MYVIMRC
command! ConfigEdit edit $MYVIMRC
command! ColorsOn :colorscheme monokai
command! ColorsOff :colorscheme monotone

" pane navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" file nav
map <C-p> :FZF<Cr>
map <C-n> :CocCommand explorer<Cr>
