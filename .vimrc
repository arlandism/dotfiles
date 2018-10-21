filetype plugin indent on
set nocompatible              " be iMproved, required
filetype off                  " required
if $TERM == "xterm-256color"
  set t_Co=256
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set guifont=Iosevka:Oblique

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-ruby/vim-ruby'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'pangloss/vim-javascript'
"Plugin 'tpope/vim-rails'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
"Plugin 'rust-lang/rust.vim'
"Plugin 'vim-scripts/VimClojure'
"Plugin 'kovisoft/paredit'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-surround'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'kien/ctrlp.vim'
Plugin 'wincent/command-t'
Plugin 'rking/ag.vim'
"Plugin 'w0rp/ale'
"Plugin 'JulesWang/css.vim'
"Plugin 'cakebaker/scss-syntax.vim'
" plugin from http://vim-scripts.org/vim/scripts.html

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

colorscheme tomorrow-night-bright " I like gruvbox and xoria256 and lucius and apprentice and asu1dark and wombat 256 and lizard256 and Tomorrow-Night-Bright
set background=light
syntax on
set wildignore+=*.class
set wildignore+=*.jar
set wildignore+=*.a
set wildignore+=*.git
set wildignore+=*/node_modules/*
"let g:clojure_fuzzy_indent_patterns = ['^describe', '^it', '^should', '^should=', '^context']
"let g:clojure_align_subforms = 0
"let g:rspec_runner = \"os_x_iterm2"
"let g:ctrlp_match_window = 'results:15'
"let g:ctrlp_custom_ignore = {
"      \ 'dir': 'node_modules\|git\|db/data\|tmp\|vendor\|career-sites',
"      \ 'file': '.zip\|.png\|.gif\|.jpeg\|.jpg\|.gz\|.tar\|.dmg',
"      \ }
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'
""let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_check_on_open = 0
"let g:syntastic_enable_signs = 0

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
nmap <silent> <c-p> <Plug>(CommandT)
autocmd BufWritePre * StripWhitespace
au BufNewFile,BufRead *.cljs,*.cljx,*.boot set filetype=clojure
au BufNewFile,BufRead *.jsx set filetype=javascript
au BufNewFile,BufRead Gemfile set filetype=ruby
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
set backspace=2
set nu
set noswapfile
set incsearch
set hlsearch
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
nmap , \
"set nofoldenable
"set foldmethod=indent
"set foldnestmax=10
"set foldlevel=1
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

let NERDTreeShowHidden = 1
let NERDTreeCasadeOpenSingleChildDir = 1
"autocmd VimEnter * ToggleStripWhitespaceOnSave
" ag word under cursor
nmap g. :Ag <C-R><C-W>
" replace word under cursor
nmap g' :%s/<C-R><C-W>/

cnoreabbrev <expr> AG ((getcmdtype() is# ':' && getcmdline() is# 'AG')?('Ag'):('AG'))
command HashFix %s/:\(\w\+\)\s*=>\s*/\1: /g
