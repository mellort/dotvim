" tmellor's vimrc
" @email timothy.mellor@gmail.com

" -----------------------------------------------------------------------------
" Mandatory stuff for vundle
" -----------------------------------------------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" mandatory for some plugins
set t_Co=256
set t_ut=
syntax enable


" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" -----------------------------------------------------------------------------
" Plugin Bundles
" -----------------------------------------------------------------------------


" Library
Bundle 'vim-scripts/L9'

" UI improvements
Bundle 'wycats/nerdtree'
    nnoremap <Leader>nt :NERDTreeToggle<CR>
    nnoremap <Leader>nf :NERDTreeFind<CR>

Bundle 'majutsushi/tagbar'
    nnoremap <Leader>tg :TagbarToggle<CR>

Bundle 'bling/vim-airline'
    set lazyredraw
    set ttimeoutlen=50
    " Remove arrow separators, only really look nice with powerline font
    " anyway
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''

" Utilities
Bundle 'mileszs/ack.vim'
    " nnoremap <Leader>a :LAck<Space>
    " ack isn't working right :/
    " http://thejacklawson.com/2011/12/vim-cant-open-errofile/index.html
    set shell=/bin/bash

Bundle 'rking/ag.vim'
    nnoremap <Leader>a :LAg -t<Space>

Bundle 'tsaleh/vim-align'
    " Easy access to Align
    nnoremap <Leader>= :Align 
    vnoremap <Leader>= :Align 

Bundle 'vim-scripts/FuzzyFinder'

Bundle 'mellort/ctrlp.vim'
    nnoremap <Leader>pb :CtrlPBuffer<CR>
    nnoremap <Leader>ft :CtrlPTag<CR>
    nnoremap <Leader>fi :CtrlPBufTag<CR>
    nnoremap <Leader>fl :CtrlPLine<CR>
    nnoremap <Leader>fc :CtrlPChange<CR>
    nnoremap <Leader>fu :CtrlPMRUFiles<CR>
    nnoremap <Leader>fd :CtrlPBookmarkDir<CR>

    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_working_path_mode = ''
    let g:ctrlp_by_filename = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_max_files = 1000000

Bundle 'mellort/ctrlp-command'
    let g:ctrlp_extensions = ['command']
    nnoremap <Leader>fc :CtrlPCommand<CR>


Bundle 'chrisbra/NrrwRgn'
    nnoremap <Leader>nr :NR<CR>

" should i move to unite.vim ??
" will use this to setup in case i want to switch later
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-help'
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])

    if executable('ack-grep')
        let g:unite_source_grep_command = 'ack-grep'
        let g:unite_source_grep_default_opts = '--no-heading --no-color -w'
    endif


    " Search through Unite sources themselves
    nnoremap <Leader>fs :Unite -start-insert -buffer-name=sources source<cr>

    " find file
    " nnoremap <Leader>ff :Unite -start-insert -buffer-name=files file_rec/async<cr>
    " find line in file
    " nnoremap <Leader>fl :Unite -start-insert -buffer-name=line line<cr>

    " Custom Unite settings
    autocmd FileType unite call s:unite_settings()
    function! s:unite_settings()
        nmap <buffer> <ESC> <Plug>(unite_exit)
        imap <buffer> <C-a> <Plug>(unite_choose_action)
        nmap <buffer> <C-a> <Plug>(unite_choose_action)
        imap <buffer> <C-j> <Esc><Plug>(unite_loop_cursor_down)
    endfunction




" Manipulation
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'

" Code completion
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'SirVer/ultisnips'
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsExpandTrigger="<tab>"
    nnoremap <Leader>ue :call UltiSnipsEditDefaultSnippets()<CR>
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    function! UltiSnipsEditDefaultSnippets()
    execute 'vsp ~/dotvim/bundle/UltiSnips/UltiSnips/' . &ft . '.snippets'
    endfunction

    " edit my ultisnips
    nnoremap <Leader>se :UltiSnipsEdit<CR>

" this is cool but i never use it...
" Bundle 'mattn/zencoding-vim'

" Source Control
" Bundle 'tpope/vim-fugitive'
" Bundle 'gregsexton/gitv'
Bundle 'sjl/gundo.vim'
    nnoremap <Leader>gt :GundoToggle<CR> 

" Window/buffer/tab manipulation
Bundle 'vim-scripts/ZoomWin'
    nnoremap <Leader>zw :ZoomWin<CR>

" Bundle 'mutewinter/LustyJuggler'
Bundle 'christoomey/vim-tmux-navigator'

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
Bundle 'jonathanfilip/vim-lucius'

"" Light
Bundle 'endel/vim-github-colorscheme'
Bundle 'therubymug/vim-pyte'
Bundle 'Cleanroom'

" Syntax
Bundle 'scrooloose/syntastic'

""" Language Specific """

" Less (css)
Bundle 'lunaru/vim-less'

" C
Bundle 'vim-scripts/a.vim'

" Python
" Bundle 'kevinw/pyflakes-vim'
" Bundle 'fs111/pydoc.vim'
Bundle 'klen/python-mode'
    let g:pymode_syntax = 1

" Bundle 'nvie/vim-pep8'
" Bundle 'lambdalisue/nose.vim'
" Bundle 'mellort/nose.vim'
" Bundle 'mellort/vim-makegreen'
"   nnoremap <Leader>t :call MakeGreen('%')<CR>

" Css
"" these are really cool, but they slow down vim ALOT
" Bundle 'skammer/vim-css-color'
" Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim'

" Velocity
" Bundle 'velocity.vim'
Bundle "lepture/vim-velocity"

" Dust
Bundle "jimmyhchan/dustjs.vim"

" Lisp
" Bundle 'vim-scripts/slimv.vim'

" Javascript
Bundle 'pangloss/vim-javascript'

" Ruby
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'tpope/vim-rake'
" Bundle 'tpope/vim-endwise'

" Coffeescript
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on " required!

" -----------------------------------------------------------------------------
" Plugin Setup / Shortcuts / Maps
" -----------------------------------------------------------------------------


" status line
" always show status bar
set laststatus=2

" -----------------------------------------------------------------------------
" General setup
" -----------------------------------------------------------------------------

" special char for vertical split 
set fillchars=vert:│ 

" always vsplit with new window on right
set splitright

"" Randomly select colorscheme
let schemes = 'jellybeans zenburn kolor Tomorrow-Night lucius'
let seconds = str2nr(strftime('%S'))

" note: need to manually change # here
execute 'colorscheme '.split(schemes)[seconds%5] 
set background=dark


""" Editing behavior """
" these are all taken from some vimrc online, edited down to ones i agree with
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
nnoremap <Leader>bu :BundleInstall!<CR>
nnoremap <Leader>bc :BundleClean!<CR>
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

autocmd FileType python compiler nose
autocmd FileType ruby compiler rubyunit

" 2 spaces for tab in vim script
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 2 spaces for tab in html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 2 spaces for tab in js
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Set velocity syntax (redundant but necessary?)
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

" only works with gvim
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

" best idea ever, who needs semi colon
map ; :

" nice refactoring of css with =
autocmd filetype less setlocal equalprg=csstidy\ -\ --template=low\ --silent=true
autocmd filetype css setlocal equalprg=csstidy\ -\ --template=low\ --silent=true


" -----------------------------------------------------------------------------
" Hostname specific settings
" -----------------------------------------------------------------------------

" TripAdvisor work specific settings
if hostname() == "tmellor-box"
    """ Auto flush caches
    " refresh velocity
    autocmd BufWritePost *.vm silent !$TRTOP/scripts/tweak flush velocity >/dev/null 2>&1 &
    " refresh dust
    autocmd BufWritePost *.dust silent !$TRTOP/scripts/tweak flush dust >/dev/null 2>&1 &

    """ Auto make ctags
    " make velocity tags
    autocmd BufWritePost *.vm silent !cd $TRTOP && ctags -R -f velocity_tags $TRTOP/site/velocity_redesign > /dev/null 2>&1 &
    " make js tags
    autocmd BufWritePost *.js silent !cd $TRTOP && ctags -R -f js_tags $TRTOP/site/js3/src > /dev/null 2>&1 &
    " make less tags
    autocmd BufWritePost *.less silent !cd $TRTOP && ctags -R -f less_tags $TRTOP/site/css2/mobile/base.less > /dev/null 2>&1 &
    " make java tags
    autocmd BufWritePost *.java silent !cd $TRTOP && make tags > /dev/null 2>&1 &

    """ Auto convert less -> css
    " if you don't have css_compress and css_concat tweaked off
    " this will take longer than necessary
    autocmd BufWritePost *.less silent !make -C $TRTOP/site/css2/tablet > /dev/null 2>&1 &

    """ Syntax recognition and code formatting 
    autocmd FileType *.vm set tabstop=2 | set shiftwidth=2 | set expandtab
    autocmd FileType *.js set tabstop=2 | set shiftwidth=2 | set expandtab
    autocmd FileType *.java set tabstop=4 | set shiftwidth=4 | set expandtab
    autocmd FileType *.css,*.less set tabstop=2 | set shiftwidth=2 | set expandtab

    """ LOAD TAGS
    """ we can speed up tag search by only loading tags
    """ for the relevant files, ie JS tags when you're editing
    """ js files or in a js directory.
    """ Note: you might want to modify this to load js/css/vm tags
    """ at the same time.

    " the `set tags+=FILE,FILE;DIR` syntax
    " searches for tags in FILE, and also searches
    " for tags in FILE in parent directories up to DIR
    let s:current_file = expand('%:p')
    let s:current_dir = getcwd()

    " java tags
    autocmd BufRead,BufNewFile *.java set tags+=tags,tags;$TRTOP
    if s:current_file =~ '/trsrc.*/tr/' || s:current_dir =~ '/trsrc.*/tr$'
      set tags+=tags,tags;$TRTOP
    endif

    " js tags
    autocmd BufRead,BufNewFile *.js set tags+=js_tags,js_tags;$TRTOP
    if s:current_file =~ '/trsrc.*/js3/' || s:current_dir =~ '/trsrc.*/js3'
      set tags+=js_tags,js_tags;$TRTOP
    endif

    " velocity tags
    autocmd BufRead,BufNewFile *.vm set tags+=velocity_tags,velocity_tags;$TRTOP
    if s:current_file =~ '/trsrc.*/velocity_redesign/' || s:current_dir =~ '/trsrc.*/velocity_redesign'
      set tags+=tags,tags;$TRTOP
    endif
        
    " less tags
    autocmd BufRead,BufNewFile *.less set tags+=less_tags,less_tags;$TRTOP
    if s:current_file =~ '/trsrc.*/css2/' || s:current_dir =~ '/trsrc.*/css2'
      set tags+=less_tags,less_tags;$TRTOP
    endif

    nnoremap <Leader>mb :sp $TRTOP/site/css2/mobile/base.less<CR> 


    function! AddTABookMarksToCtrlP()
      call ctrlp#bookmarkdir#add($TRTOP, "trtop")

      call ctrlp#bookmarkdir#add($TRTOP . "/tr", "tr java")

      call ctrlp#bookmarkdir#add($TRTOP . "/site/css2", "tr css")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/css2/mobile", "tr css mobile")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/css2/tablet", "tr css tablet")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/css2/tablet/svg", "tr css tablet svg sprite")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/css2/tablet/redesign", "tr css tablet rx")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/css2/tablet/redesign", "tr css tablet rx")

      call ctrlp#bookmarkdir#add($TRTOP . "/site/js3/src", "tr js")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/js3/src/mobile", "tr js mobile")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/js3/src/tablet", "tr js tablet")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/js3/src/tablet/redesign", "tr js tablet rx")

      call ctrlp#bookmarkdir#add($TRTOP . "/site/velocity_redesign", "tr vm")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/velocity_redesign/common", "tr vm common")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/velocity_redesign/mobile", "tr vm mobile")
      call ctrlp#bookmarkdir#add($TRTOP . "/site/velocity_redesign/tablet", "tr vm tablet")
      call ctrlp#bookmarkdir#add($TRTOP .  "/site/velocity_redesign/tablet/redesign", "tr vm tablet rx")

      call ctrlp#bookmarkdir#add($TRTOP .  "/site/dust/src", "tr dust")
      call ctrlp#bookmarkdir#add($TRTOP .  "/site/dust/src/modules", "tr dust modules")
      call ctrlp#bookmarkdir#add($TRTOP .  "/site/dust/src/tablet", "tr dust tablet")

      call ctrlp#bookmarkdir#add($TRTOP .  "/site/svg", "tr svg")
      call ctrlp#bookmarkdir#add($TRTOP .  "/site/svg", "tr svg")
      call ctrlp#bookmarkdir#add($TRTOP .  "/site/svg/mobile", "tr svg mobile")
      call ctrlp#bookmarkdir#add($TRTOP .  "/site/svg/tablet", "tr svg tablet")

      call ctrlp#bookmarkdir#add($TRTOP .  "/scripts/api/python", "tr api tests")
    endfunction
endif
