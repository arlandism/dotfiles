filetype plugin indent on
set nocompatible              " be iMproved, required
filetype off                  " required
if $TERM == "xterm-256color"
  set t_Co=256
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set guifont="Operator Mono"

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-ruby/vim-ruby'
"Plugin 'vim-syntastic/syntastic'
Plugin 'pangloss/vim-javascript'
"Plugin 'HerringtonDarkholme/yats'
"Plugin 'tpope/vim-rails'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
"Plugin 'rust-lang/rust.vim'
"Plugin 'vim-scripts/VimClojure'
Plugin 'kovisoft/paredit'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-surround'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'leafgarland/typescript-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'triglav/vim-visual-increment'
"Plugin 'wincent/command-t'
Plugin 'rking/ag.vim'
Plugin 'prettier/vim-prettier'
Plugin 'neoclide/coc.nvim'
Plugin 'frazrepo/vim-rainbow'
"Plugin 'w0rp/ale'
"Plugin 'JulesWang/css.vim'
"Plugin 'cakebaker/scss-syntax.vim'
" plugin from http://vim-scripts.org/vim/scripts.html

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

colorscheme Tomorrow-Night " I like gruvbox and xoria256 and lucius and apprentice and asu1dark and wombat 256 and lizard256 and Tomorrow-Night-Bright
syntax on
set wildignore+=*.class
set wildignore+=*.jar
set wildignore+=*.a
set wildignore+=*.git
set wildignore+=*/node_modules/*
"let g:clojure_fuzzy_indent_patterns = ['^describe', '^it', '^should', '^should=', '^context']
"let g:clojure_align_subforms = 0
"let g:rspec_runner = \"os_x_iterm2"
let g:ctrlp_match_window = 'results:15'
let g:ctrlp_custom_ignore = {
      \ 'dir': 'node_modules\|git\|db/data\|tmp\|vendor\|build',
      \ 'file': '.zip\|.png\|.gif\|.jpeg\|.jpg\|.gz\|.tar\|.dmg',
      \ }
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
set nofoldenable
set foldmethod=indent
set foldnestmax=10
set foldlevel=1
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

let NERDTreeShowHidden = 1
let NERDTreeCasadeOpenSingleChildDir = 1
let macvim_skip_colorscheme=1
"autocmd VimEnter * ToggleStripWhitespaceOnSave
" ag word under cursor
nmap g. :Ag <C-R><C-W>
" replace word under cursor
nmap g' :%s/<C-R><C-W>/

let g:prettier#config#parser = 'typescript'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#single_quote = 'false'
map <silent> <LocalLeader>pf :Prettier<CR>
nmap <silent> <c-p> <Plug>(CommandT)

cnoreabbrev <expr> AG ((getcmdtype() is# ':' && getcmdline() is# 'AG')?('Ag'):('AG'))
command HashFix %s/:\(\w\+\)\s*=>\s*/\1: /g

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt
let g:rainbow_active = 1
