filetype plugin indent on
set nocompatible              " be iMproved, required
filetype off                  " required
if $TERM == "xterm-256color"
  set t_Co=256
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'kovisoft/paredit'
Plugin 'tpope/vim-fireplace'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
" plugin from http://vim-scripts.org/vim/scripts.html

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

colorscheme xoria256 " I like gruvbox
syntax on
set wildignore+=*.class
set wildignore+=*.jar
set wildignore+=*.a
let g:clojure_fuzzy_indent_patterns = ['^describe', '^it', '^should', '^should=', '^context']
let g:clojure_align_subforms = 0
let g:rspec_runner = "os_x_iterm2"
au BufNewFile,BufRead *.cljs,*.cljx,*.boot set filetype=clojure
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
set backspace=2
set nu
set noswapfile
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
nmap , \
set nofoldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=1
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeCasadeOpenSingleChildDir = 1
"autocmd VimEnter * ToggleStripWhitespaceOnSave

cnoreabbrev <expr> AG ((getcmdtype() is# ':' && getcmdline() is# 'AG')?('Ag'):('AG'))
