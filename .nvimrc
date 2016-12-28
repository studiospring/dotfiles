"" "****** BEHAVIOUR *******"
filetype plugin indent on     
" Enable spell checker
autocmd FileType markdown setlocal spell
set lazyredraw
set noswapfile
"" Read file if changed outside of vim
set autoread
"" yank also copies to clipboard (Cmd-c)
set clipboard=unnamed
"" Fixes clipboard error: target string not available
let g:yankring_clipboard_monitor=0
"" 'dd' does not save to yankring
"" See http://items.sjbach.com/319/configuring-vim-right for an
"" explanation of the following:
set hidden
set wildmode=list:longest,full

"" Open last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.config/nvim")) |
  \ call mkdir($HOME . "/.config/nvim") |
  \ endif |
  \ execute "mksession! " . $HOME . "/.config/nvim/Session.vim"
autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.config/nvim/Session.vim") |
    \ execute "source " . $HOME . "/.config/nvim/Session.vim"

"" Persistent undo
set undodir=/tmp/nvim_undodir
set undofile

"" remove trailing whitespace before saving
autocmd BufWritePre *.{rb,yml,slim,js,coffeescript,css} :%s/\s\+$//e

let g:python_host_program = '/usr/bin/python3'
"" "****** PLUGINS *******"
"" Update Vimplug: PlugUpgrade
"" Update plugins: PlugUpdate
"" Do not forget there are also rc settings in ~/.config/nvim/ftplugin.
"" required! 
call plug#begin('~/.config/nvim/autoload/plugged')
"" Note taking plugin
"" Broken
" Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes'
"" Keep this plugin above vim-bufferline, to prevent keyboard shortcut collisions
"" vim-misc is a dependency of vim-easytags and vim-notes
" let g:notes_directories = [ '~/documents/notes' ]
" let g:notes_suffix = '.txt'
" let g:notes_tab_indents = 0

" Autofold ruby and spec files. Prevents manual folding.
" Plug 'bruno-/vim-ruby-fold'
Plug 'jgdavey/vim-blockle'
" <Leader>b conflicts with bufferline.
let g:blockle_mapping = '<Leader>r'

"" vim-misc is a dependency of vim-easytags and vim-notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
"" Find method definitions using vim tags
"" Optimisation
let g:easytags_python_enabled = 1
Plug 'bling/vim-airline'
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_extensions = ['branch', 'bufferline',  'syntastic']
"" Show buffers at top of window
let g:airline#extensions#tabline#enabled = 0

" set statusline=line:\ %l/%L\ (%2p%%)\ %<%f\ %m\ %r\

let g:airline#extensions#default#layout = [
      \['a', 'c', 'b'],
      \['warning']
      \]
let g:airline_section_a = '  %l/%L (%2p%%) col:%c'
" let g:airline_section_b       (hunks, branch)
" let g:airline_section_gutter  (readonly, csv)
let g:airline_section_c = '%<%f %m %r' 
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_section_warning = ('syntastic')

" Prevent lag after pressing ESC. This is only relevant if you run airline or powerline
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
"" Required for vim-airline to show git branch
Plug 'tpope/vim-fugitive'
""  Plug 'Townk/vim-autoclose'
"" Show buffers in commandline
Plug 'bling/vim-bufferline'
Plug 'flazz/vim-colorschemes'
"Plug 'Lokaltog/vim-easymotion'
Plug 'Konfekt/FastFold'
"" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" Search current dir recursively
map <leader>t :FZF<CR>
" Search home dir recursively
map <leader>h :FZF ~<CR>
Plug 'Yggdroot/indentLine'
" let g:indentLine_loaded = 2
let g:indentLine_char = '┊'
" let g:indentLine_color_term = 239
" set list lcs=tab:\|\
Plug 'jwhitley/vim-matchit'
"" Tab completion
Plug 'justinmk/vim-sneak'
Plug 'ervandew/supertab'
" Does not work yet! (09/15)
" Does not work with Neovim without python extension (as at 09/15) :-(
" Plug 'Shougo/deoplete.config/nvim'
" let g:deoplete#enable_at_startup = 1
" Plug 'Shougo/neosnippet-snippets'
" let g:neosnippet#snippets_directory = '/home/sean/.config/nvim/autoload/plugged/neosnippet-snippets/neosnippets/vim/*.snip'
" Plug 'Shougo/context_filetype.vim'
" Plugin key-mappings.
" imap <C-i>     <Plug>(neosnippet_expand_or_jump)
" smap <C-i>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-i>     <Plug>(neosnippet_expand_target)

 " SuperTab like snippets behavior.
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" Dependencies for garbas/vim-snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" End dependencies
Plug 'garbas/vim-snipmate'
"Adds extra snippets
Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdcommenter'
  " let NERDCreateDefaultMappings=0
" let NERDDefaultNesting=0
let NERDSpaceDelims=1
"" Ignore indentation
map <leader>c <plug>NERDCommenterAlignBoth
Plug 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeSortHiddenFirst=1
let NERDTreeQuitOnOpen=1
" vim-rails seems to break filetype syntax highlighting
" Plug 'tpope/vim-rails'
"" Speedy html markup; just use Slim
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
  " prevent conflict with Supertab
  "  let g:sparkupNextMapping = '<c-x>'
Plug 'tpope/vim-surround'
Plug 'Syntastic'
highlight SyntasticErrorLine guibg=#5f5f5f
Plug 'vim-scripts/YankRing.vim' 
nnoremap <leader>y :YRShow<cr>
"" Persist state between sessions
" Plug 'kopischke/vim-stay'
" set viewoptions=cursor,slash,unix
set viewoptions=cursor,folds,slash,unix
" Numbers search match
" Breaks search (30/9)
" Plug 'henrik/vim-indexed-search'
" Coffeescript syntax highlighting, among other things.
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'othree/html5.vim'
" Plug '~/dev/vim-origami'
" nnoremap <leader>f :OrigamiIncreaseFoldlevel<CR>
" nnoremap <leader><S-f> :OrigamiDecreaseFoldlevel<CR>
" Plugin testing framework
Plug 'junegunn/vader.vim'
"" All plugins must be added before this line
"" required by VimPlug
call plug#end()
"" "****** APPEARANCE ******"
"" enable 256 colors
set t_Co=256
color Tomorrow-Night
set linebreak
set ruler
set relativenumber
set number
" highlight current line without underline
hi CursorLine term=NONE cterm=NONE ctermbg=Black
" Set colour of linenumbers
highlight LineNr ctermfg=067
set autoindent
set smartindent
""start scrolling when 3 lines from edge of screen
set scrolloff=3
"" go to bottom of wrapped line (useful when linewrap is on)
set display=lastline
set tabstop=2		
set softtabstop=2
set shiftwidth=2
set expandtab
"" set textwidth=80
" How vim formats text. See fo-options help for options.
set formatoptions=qrn1 
" Syntax highlighting for files that are not recognised by default.
au BufRead,BufNewFile Guardfile setfiletype rb
au BufNewFile,BufRead *.slim set ft=slim
"" "allow indent of selected lines regardless of how they are selected
"" set selectmode=
"" " Convenient command to see the difference between the current buffer and the
"" " file it was loaded from, thus the changes you made.
"" " Only define it when not defined already.
"" if !exists(":DiffOrig")
""   command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
""       \ | wincmd p | diffthis
"" endif

"" Highlight the 81st column of wide lines
highlight ColorColumn ctermbg=22
call matchadd('ColorColumn', '\%81v', 100)

" This rewires n and N to do the search highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

"" Highlight the search match in red
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  highlight WhiteOnRed ctermbg=red
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#\%('.@/.'\)'
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction
"" "****** FOLDS ******"
"" Show where folds are located
set foldcolumn=2
" Colourise fold
hi Folded ctermfg=038
hi FoldColumn ctermfg=038


fu! CustomFoldText()
  "get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("", v:foldlevel)
  let lineCount = line("$")
  let paddingString = repeat("-", 50 - strwidth(foldSizeStr.line.foldLevelStr))
  let expansionString = repeat("-", w - strwidth(foldSizeStr.line.foldLevelStr.paddingString))
  return  foldLevelStr . line . '  ' . paddingString . foldSizeStr . expansionString
endf
set foldtext=CustomFoldText()

" set foldlevelstart=1
"" Let me fold top level without folding nested folds
" set foldnestmax=2
" let javaScript_fold=1
" let ruby_fold=1
"let sh_fold_enabled=1         " sh
"let vimsyn_folding='af'       " Vim script
"let xml_syntax_folding=1      " XML
augroup RememberFolds
  au BufWrite,VimLeave *.* mkview
  au BufRead           *.* silent loadview
augroup END
"" "****** SEARCH ******"
"" Incremental searching
set incsearch
set ignorecase
set smartcase
set hlsearch
"" Set the search scan to wrap around the file
set wrapscan
"" "****** INSERT MODE ******"
"" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
""omnicompletion
""  set ofu=syntaxcomplete#Complete
"
"" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
""  " CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
""  " so that you can undo CTRL-U after inserting a line break.
""  inoremap <C-U> <C-G>u<C-U>"  nnoremap ; :
""  nnoremap <leader>w <C-w>v<C-w>l
"" This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
  silent exe "normal! `[v`]\"_c"
  silent exe "normal! p"
endfunction
"" paste into line above and indent
map <leader>P O<ESC>p ==
"" paste into line below and indent
map <leader>p o<ESC>p ==

"" paste below where cursor first was
nnoremap <leader-v> mz k
nmap <leader-p> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
  silent exe "normal! `[v`]\"_c"
  silent exe "normal! p"
endfunction

"" Pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv
"" "****** NORMAL MODE ******"
" Use spacebar as leader key and have it appear in showcmd
map <space> <leader>
"" Remap save
nnoremap <leader>s :w<cr>
nnoremap <leader><shift>s :w!<cr>
"" Scroll page down
nnoremap <leader>j <C-f>
"" Scroll page up
nnoremap <leader>k <C-b>
"" Scroll half page down
nnoremap <right> <C-d>
"" Scroll half page up
nnoremap <left> <C-u>
"" Scroll one line down
nnoremap <down> <C-e>
"" Scroll one line up
nnoremap <up> <C-y>
"" ctrl-k, ctrl-j to move cursor up/down 10 lines
map <C-k> 10k
map <C-j> 10j
map <leader>d :bd <CR>
map <leader>b :bn <CR>
map <leader>B :bN <CR>
nnoremap <C-TAB> :bn <CR>
"" Resize split windows. Useful when using vimdiff
nnoremap <silent> <leader>> :vertical resize 50
nnoremap <silent> <leader>< :vertical resize -50
"" Move vertically in the window through the horizontal splits... 
" Need to map to different keys
map <C-9> <C-w>j<C-w>_ 
map <C-8> <C-w>k<C-w>_ 
" " Move horizontally in the window through the vertical splits... 
" map <C-H> <C-w>h<C-w>\| 
" map <C-L> <C-w>l<C-w>\| 
"" Yank to end of line
nnoremap Y y$
"" Yank whole line from anywhere on the line without line break
nnoremap yl ^y$
"" Cut whole line from anywhere on the line without line break
map dl ^d$
" Paste to X11 clipboard.
" nnoremap yy "+yy
" Use fzf to switch buffer.
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>b :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
" Remove highlighting when changing to insert mode.
" autocmd CmdwinEnter * nnoremap <CR> <CR>
"autocmd BufReadPost quickfix nnoremap <CR> <CR>
" nnoremap i :noh<CR> i
"" "****** COMMAND MODE ******"
cabbrev h tab help
" write to a readonly file
silent command Sudow w !sudo tee % >/dev/null
