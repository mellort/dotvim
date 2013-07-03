" 
" tmellor's vimrc
" @email timothy.mellor@gmail.com
" 

" -----------------------------------------------------------------------------
" Mandatory stuff for vundle
" -----------------------------------------------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

filetype plugin indent on " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" mandatory for some plugins
set t_Co=256

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" -----------------------------------------------------------------------------
" Plugin Bundles
" -----------------------------------------------------------------------------

""" Language Agnostic """

" Library
Bundle 'vim-scripts/L9'

" UI improvements
Bundle 'wycats/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
set lazyredraw
set ttimeoutlen=50

" Utilities
Bundle 'mileszs/ack.vim'
Bundle 'tsaleh/vim-align'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'kien/ctrlp.vim'
Bundle 'chrisbra/NrrwRgn'

" Manipulation
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'

" Code completion
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'vim-scripts/UltiSnips'
Bundle 'mattn/zencoding-vim'

" Source Control
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'gregsexton/gitv'

" Window/buffer/tab manipulation
Bundle 'vim-scripts/ZoomWin'
" LJ seems cool, but never use it
" Bundle 'mutewinter/LustyJuggler'
" also use 'mpage' but it doesnt have a repo,
" included manually
set rtp+=~/.vim/bundle/mpage/

" Colors
"" Dark
Bundle 'matthewtodd/vim-twilight'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tomasr/molokai'
Bundle 'godlygeek/csapprox'
Bundle 'vim-scripts/vydark'
Bundle 'vexxor/zenburn.vim'
Bundle 'cstrahan/grb256'
Bundle 'zeis/vim-kolor'
Bundle 'chriskempson/vim-tomorrow-theme'

"" Light
Bundle 'endel/vim-github-colorscheme'
Bundle 'therubymug/vim-pyte'
Bundle 'Cleanroom'

" Syntax
Bundle 'scrooloose/syntastic'
" Bundle 'groenewege/vim-less'
Bundle 'lunaru/vim-less'

""" Language Specific """

" C
Bundle 'vim-scripts/a.vim'

" Python
" Bundle 'kevinw/pyflakes-vim'
" Bundle 'fs111/pydoc.vim'
Bundle 'klen/python-mode'
" Bundle 'nvie/vim-pep8'
" Bundle 'lambdalisue/nose.vim'
Bundle 'mellort/nose.vim'
Bundle 'mellort/vim-makegreen'

" Java
" see http://www.vim.org/scripts/script.php?script_id=1785
Bundle 'javacomplete'

" Css
"" these are really cool, but they slow down vim ALOT
" Bundle 'skammer/vim-css-color'
" Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim'

" Velocity
" Bundle 'velocity.vim'
Bundle "lepture/vim-velocity"

" Lisp
" Bundle 'vim-scripts/slimv.vim'

" Javascript
Bundle 'pangloss/vim-javascript'
" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-endwise'

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'
" Coffeescript
Bundle 'kchmck/vim-coffee-script'

" -----------------------------------------------------------------------------
" Plugin Setup / Shortcuts / Maps
" -----------------------------------------------------------------------------


" a.vim
nnoremap <Leader>sa :A<CR>


" python-mode
" required
let g:pymode_syntax = 1
" remote breakpoint shortcut
let g:pymode_breakpoint = 1
" Key for set/unset breakpoint
" let g:pymode_breakpoint_key = '<Leader>pb'

" makegreen
nnoremap <Leader>t :call MakeGreen('%')<CR>
" nnoremap <Leader>at :call MakeGreen('.')<CR>

" Easy access to Align
nnoremap <Leader>= :Align 
vnoremap <Leader>= :Align 

" Shortcut to ZoomWin
nnoremap <Leader>z :ZoomWin<CR>

" Run Ack fast
"nnoremap <Leader>a :Ack<Space>
nnoremap <Leader>a :LAck<Space>

" toggle tagbar
nnoremap <Leader>tg :TagbarToggle<CR>
" generate ctags
nnoremap <Leader>ct :silent! ctags -R --extra=+f

" fuzzy funder
" nnoremap <Leader>ff :FufFileWithCurrentBufferDir<CR>
" nnoremap <Leader>fb :FufBuffer<CR>
" nnoremap <Leader>ft :FufTaggedFile<CR>
" nnoremap <Leader>fg :FufTag<CR>
" nnoremap <Leader>fl :FufLine<CR>

" ctrl p
nnoremap <Leader>pb :CtrlPBuffer<CR>
nnoremap <Leader>ft :CtrlPTag<CR>

" status line
" always show status bar
set laststatus=2

" ultisnips                                 
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"   " doesn't appear to work, replaced with below
nnoremap <Leader>ul :call UltiSnips_ListSnippets()<CR>
nnoremap <Leader>ue :call UltiSnipsEditDefaultSnippets()<CR>
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

function! UltiSnipsEditDefaultSnippets()
  execute 'vsp ~/dotvim/bundle/UltiSnips/UltiSnips/' . &ft . '.snippets'
endfunction

" edit my ultisnips
nnoremap <Leader>se :UltiSnipsEdit()<CR>

" nerd tree toggle
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>


" latex hw compile
" nnoremap <silent> <Leader><Leader> :!pdflatex hw.tex &<CR>

" ack isn't working right :/
" http://thejacklawson.com/2011/12/vim-cant-open-errofile/index.html
set shell=/bin/bash

" -----------------------------------------------------------------------------
" General setup
" -----------------------------------------------------------------------------

" always vsplit with new window on right
set splitright

""" Color setup """
set background=dark
" colorscheme jellybeans

"" Randomly select colorscheme
let schemes = 'jellybeans zenburn kolor Tomorrow-Night'
let seconds = str2nr(strftime('%S'))

execute 'colorscheme '.split(schemes)[seconds%4]
" redraw


""" Editing behavior """
set showmode                             " always show what mode we're currently editing in
set nowrap                               " don't wrap lines
set tabstop=4                            " a tab is four spaces
set softtabstop=4                        " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                            " expand tabs by default (overloadable per file type later)
set shiftwidth=4                         " number of spaces to use for autoindenting
set shiftround                           " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start           " allow backspacing over everything in insert mode
set autoindent                           " always set autoindenting on
set copyindent                           " copy the previous indentation on autoindenting
set number                               " always show line numbers
set showmatch                            " set show matching parenthesis
set ignorecase                           " ignore case when searching
set smartcase                            " ignore case if search pattern is all lowercase,
                                         " case-sensitive otherwise
set smarttab                             " insert tabs on the start of a line according to
                                         " shiftwidth, not tabstop
set scrolloff=4                          " keep 4 lines off the edges of the screen when scrolling
set hlsearch                             " highlight search terms
set incsearch                            " show search matches as you type
set gdefault                             " search/replace "globally" (on a line) by default

set nolist                               " don't show invisible characters by default,
set mouse=a                              " enable using the mouse if terminal emulator
                                         " supports it (xterm does)
set fileformats=                         " unix,dos,mac

set termencoding=utf-8
set encoding=utf-8
set virtualedit=onemore

set history=1000                         " remember more commands and search history
set undolevels=1000                      " use many muchos levels of undo

set undofile                             " keep a persistent backup file
set undodir=~/.vim/.undo,~/tmp,/tmp

set nobackup                             " the backup feature is annoying, use source control
                                         "   but if you must...
set directory=~/.vim/.swap,~/tmp,/tmp    " store swap files in one of these directories
set backupdir=~/.vim/.backup,~/tmp,/tmp  " store swap files in one of these directories

set wildmenu                             " make tab completion for files/buffers act like bash
set wildmode=list:full                   " show a list when pressing tab and complete
                                         " first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                " change the terminal's title
set novisualbell                         " don't blink
set noerrorbells                         " don't beep
" set showcmd                              " show (partial) command in the last line of the screen
                                         " this also shows visual selection info
set nomodeline                           " disable mode lines (security measure)
set cursorline                           " underline the current line, for quick orientation
set cursorcolumn

""" Search and Movement """

" Make vim use regular regexps (very magic)
" @see http://stevelosh.com/blog/2010/09/coming-home-to-vim
" @see :help \v
nnoremap / /\v
vnoremap / /\v

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Quickfix window with last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" ctag navigation
nnoremap <C-V><C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


""" Utility """

" restore position in file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" save when focus lost
:au FocusLost * silent! :wa

" Auto resize windows when vim resized
autocmd VimResized * wincmd =

" Make D and Y behave
nnoremap D d$
nnoremap Y y$

""" Gvim specific """
if has('gui_running')
  " Not sure which of these are totally necessary
  " but I want to get rid of as much as possible.
  set guioptions-=m
  set guioptions-=M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=l
  set guioptions-=L
  set guioptions-=b
  set guioptions-=F
endif

" -----------------------------------------------------------------------------
" General Shortcuts and mappings
" -----------------------------------------------------------------------------

" reload vimrc
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>bi :BundleInstall<CR>
nnoremap <Leader>ev :edit ~/dotvim/vimrc<CR>


" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" use semicolon for commands
" http://vim.wikia.com/wiki/Map_semicolon_to_colon
map ; :

" Easier movement up and down
nnoremap H <C-D>
nnoremap L <C-U>

" Turn off highlight with space and clear messages
" @see http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Quit fast
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :wq<CR>


" %% expands to dir of current file
cnoremap %% %:p:h

" tabs
nnoremap <Leader>tk :tabnext<CR>
nnoremap <Leader>tj :tabpre<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>td :tabclose<CR>

" buffers
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>o :on<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>j :bp<CR>

" -----------------------------------------------------------------------------
" Auto/omni complete settings
" -----------------------------------------------------------------------------

" javacomplete
" Could also use CompleteParamsInfo
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

autocmd Filetype javascript set omnifunc=javascriptcomplete#CompleteJS

" -----------------------------------------------------------------------------
" Language specific settings
" -----------------------------------------------------------------------------

" python set compiler
autocmd FileType python compiler nose

" ruby
autocmd BufRead,BufNewFile *.rb colors twilight
autocmd FileType ruby compiler rubyunit

" 2 spaces for tab in vim script
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 2 spaces for tab in html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 2 spaces for tab in js
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Set velocity syntax (redundant but necessary)
autocmd BufRead,BufNewFile *.vm  setfiletype velocity

" -----------------------------------------------------------------------------
" Custom magic goes here
" -----------------------------------------------------------------------------

" Stuff below is to center the current buffer in the screen
" This is good for going full screen and editing just one file
"   at a time.
let g:centerinscreen_active = 0

function! ToggleCenterInScreen(desired_width)
  if g:centerinscreen_active == 0
    let a:window_width = winwidth(winnr())
    let a:sidepanel_width = (a:window_width - a:desired_width) / 2

    exec("silent leftabove " . a:sidepanel_width . "vsplit new")
    wincmd l
    exec("silent rightbelow " . a:sidepanel_width . "vsplit new")
    wincmd h
    let g:centerinscreen_active = 1
  else
    wincmd h
    close
    wincmd l
    close

    let g:centerinscreen_active = 0
  endif
endfunction

nnoremap <Leader>r :exec ToggleCenterInScreen(100)<CR>
nnoremap <Leader>f :call system("xte 'key F11'")<CR>

" function to toggle font scaling
let g:font_scaled = 0

function! ToggleFontScale()
  if g:font_scaled == 0
    set gfn=Ubuntu\ Mono\ 24
    let g:font_scaled = 1
  else
    set gfn=Ubuntu\ Mono\ 12
    let g:font_scaled = 0
  endif
endfunction

nnoremap <Leader>fz :call ToggleFontScale()<CR>

map ; :

" TripAdvisor work specific settings
if hostname() == "tmellor-box"
  " refresh velocity
  autocmd BufWritePost *.vm silent !$TRTOP/scripts/tweak flush velocity >/dev/null 2>&1 &
  " make velocity tags
  " autocmd BufWritePost *.vm silent !ctags -R --languages=velocity --velocity-kinds=m $TRTOP/site/velocity_redesign $TRTOP/site/velocity_redesign/{mobile,tablet,tablet/redesign} > /dev/null 2>&1 &
  autocmd BufWritePost *.vm silent !cd $TRTOP && ctags -R -f velocity_tags $TRTOP/site/velocity_redesign > /dev/null 2>&1 &
  " make js tags
  " autocmd BufWritePost *.vm silent !ctags -R --languages=velocity --velocity-kinds=m $TRTOP/site/velocity_redesign $TRTOP/site/velocity_redesign/{mobile,tablet,tablet/redesign} > /dev/null 2>&1 &
  autocmd BufWritePost *.js silent !cd $TRTOP && ctags -R -f js_tags $TRTOP/site/js3/src > /dev/null 2>&1 &

  " less -> css conversion
  autocmd BufWritePost *.less silent !make -C $TRTOP/site/css2/tablet > /dev/null 2>&1 &

  autocmd BufRead,BufNewFile *.less set filetype=less
  au BufNewFile,BufRead *.vm,*.html,*.htm,*.shtml,*.stm set ft=velocity
  autocmd FileType *.vm set tabstop=2|set shiftwidth=2|set expandtab
  autocmd BufNewFile,BufRead *.vm set tabstop=2|set shiftwidth=2|set expandtab

  set tags+=tags,tags;$TRTOP
  " set tags file to only load same ft
  autocmd BufRead,BufNewFile *.js set tags+=js_tags,js_tags;$TRTOP
  autocmd BufRead,BufNewFile *.vm set tags+=velocity_tags,velocity_tags;$TRTOP

endif


autocmd filetype less setlocal equalprg=csstidy\ -\ --template=low\ --silent=true
autocmd filetype css setlocal equalprg=csstidy\ -\ --template=low\ --silent=true


" ctrl p ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 1000000
