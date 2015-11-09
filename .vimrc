"  "****** GLOBAL *******"
set nocompatible
" required for Vundle
filetype off                   
set spelllang=en_gb
set nobackup		" do not keep a backup file, use versions instead
" set lazyredraw
set noswapfile
"  set history=50		" keep 50 lines of command line history
set noerrorbells " No noise.
let mapleader = "s"
" Open last file(s) if invoked without arguments.
"  autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"     \ call mkdir($HOME . "/.vim") |
"     \ endif |
"     \ execute "mksession! " . $HOME . "/.vim/Session.vim"
"
"  autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"      \ execute "source " . $HOME . "/.vim/Session.vim"
"

" Remember cursor position
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" Persistent undo
set undodir=~\.vim\undodir
set undofile

set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
" "****** VUNDLE *********"
" required! 
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
" My Bundles here:
"Bundle 'tpope/vim-fugitive'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'ervandew/supertab'
" prevent conflict with Supertab
"  let g:sparkupNextMapping = '<c-x>'
"  Bundle 'Townk/vim-autoclose'
" fuzzy file finder
" Plugin 'kien/ctrlp.vim'
" Plugin 'https://github.com/kien/ctrlp.vim'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
Plugin 'unite.vim'
Plugin 'blockle.vim'
Plugin 'Syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails'
" open file in new tab
"  imap gf <C-W>gf
Plugin 'flazz/vim-colorschemes'
  color Tomorrow-Night
  set background=dark
  set cursorline
  " highlight line without underline
  hi CursorLine term=bold cterm=bold guibg=Black "Grey20
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
  " enable in unsplit windows
  " set laststatus=2
  " let g:Powerline_symbols = 'fancy'
  " let g:Powerline_cache_enabled = 1
Plugin 'vim-scripts/YankRing.vim'
  nnoremap <leader>y :YRShow<cr>
Plugin 'nathanaelkane/vim-indent-guides'
"  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_space_guides = 0
  let g:indent_guides_guide_size = 0
Plugin 'scrooloose/nerdcommenter'
  " let NERDCreateDefaultMappings=0
  let NERDDefaultNesting=0
  let NERDSpaceDelims=1
  " ignore indentation
  map <leader>c <plug>NERDCommenterAlignBoth
  map <leader>g <plug>NERDComComment
Plugin 'tpope/vim-surround'
" Dependencies for garbas/vim-snippets
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'snipmate-snippets'
" End dependencies
Plugin 'garbas/vim-snipmate'
"Adds extra snippets
Plugin 'honza/vim-snippets'

Plugin 'jwhitley/vim-matchit'
Plugin 'kchmck/vim-coffee-script'
" All plugins must be added before this line
" required by Vundle
call vundle#end()
filetype plugin indent on     
" Enable fzf plugin
set rtp+=~/.fzf
" "****** APPEARANCE ******"
set guifont=DejaVu\ Sans\ Mono:h12
set linebreak
" highlight matching brace (requires pi_paren plugin)
set showmatch
" show/hide invisibles
"  set nolist
"  set autoread
"  set autowrite
"  change cursor when in insert mode
 " autocmd InsertEnter,InsertLeave * set cul!
set ruler
set relativenumber
set autoindent
set smartindent
"start scrolling when 3 lines from edge of screen
set scrolloff=3
" go to bottom of wrapped line (useful when linewrap is on)
set display=lastline
set tabstop=2		
set softtabstop=2
set shiftwidth=2
set expandtab
set wrap
" set textwidth=80
" set formatoptions=qrn1
" "allow indent of selected lines regardless of how they are selected
" set selectmode=
" " Convenient command to see the difference between the current buffer and the
" " file it was loaded from, thus the changes you made.
" " Only define it when not defined already.
" if !exists(":DiffOrig")
"   command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"       \ | wincmd p | diffthis
" endif
" " Don't use Ex mode, use Q for formatting
"
" "full screen maxes horizontally
" set fuopt+=maxhorz
" "flash screen on error
" set vb t_vb=
" show where folds are located
" set foldcolumn=2
" let me fold top level without folding nested folds
set foldnestmax=2
"  "automatically fold at methods
"  "augroup vimrc
"    "au BufReadPre * setlocal foldmethod=syntax
"    "au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
"  "augroup END
"  "another way to autofold
 " function! RubyMethodFold(line)
 " let line_is_method_or_end = synIDattr(synID(a:line,1,0), 'name') == 'rubyMethodBlock'
 "   let line_is_def = getline(a:line) =~ '\s*def '
 "   return line_is_method_or_end || line_is_def
 " endfunction
"
set foldexpr=RubyMethodFold(v:lnum)
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
" causes cursor to disappear when moving left/right
" let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
"  "vimdiff splits vertically
"  set diffopt=vertical
"  "linebreaks on in vimdiff
set linebreak
syntax enable
" display incomplete commands
set showcmd
set statusline=line:\ %l/%L\ (%2p%%)\ %<%f\ %m\ %r\ yo
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" "****** SEARCH ******"
" do incremental searching

set incsearch
set ignorecase
set smartcase

set hlsearch
" Set the search scan to wrap around the file
set wrapscan
" "****** INSERT MODE ******"
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
"omnicompletion
"  set ofu=syntaxcomplete#Complete

" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"  " CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
"  " so that you can undo CTRL-U after inserting a line break.
"  inoremap <C-U> <C-G>u<C-U>"  nnoremap ; :
inoremap ii <ESC>
"  nnoremap <leader>w <C-w>v<C-w>l
" spacebar moves page down/up
" nnoremap <space> <C-f> 
" nnoremap <S-space> <C-b> 
" This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
  silent exe "normal! `[v`]\"_c"
  silent exe "normal! p"
endfunction
" paste into line above
map <leader>P O<ESC>p
" paste into line below
map <leader>p o<ESC>p
" yank also copies to clipboard (Cmd-c)
set clipboard+=unnamed

" paste below where cursor first was
" nnoremap <leader-k> mz k
"  nmap <leader-p> cp :set opfunc=ChangePaste<CR>g@
"  function! ChangePaste(type, ...)
"      silent exe "normal! `[v`]\"_c"
"      silent exe "normal! p"
"  endfunction

" Pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv
" option-k, option-j to move cursor up/down 10 lines
map <C-k> 10k
map <C-j> 10j
" Yank to end of line
map Y y$
" Yank whole line from anywhere on the line without line break
map yl ^y$
" Cut whole line from anywhere on the line without line break
map dl ^d$
" open help in new tab
cabbrev h tab help
" See http://items.sjbach.com/319/configuring-vim-right for an
" explanation of the following:
set hidden
set wildmode=list:longest,full
" remap to save
nnoremap <leader>n :w<cr>
" Scroll half page down
nnoremap <right> <C-d>
" Scroll half page up
nnoremap <left> <C-u>
" Scroll one line down
nnoremap <down> <C-e>
" Scroll one line up
nnoremap <up> <C-y>
" "******** OTHER ********"
" remove trailing whitespace before saving
autocmd BufWritePre *.{rb,yml,haml,js,coffeescript,css} :%s/\s\+$//e

" type 'phall' to add everyone to phabricator reviewer
ab phall allen, dylan, mark, mpalmer, rob, rgh, sanjita
