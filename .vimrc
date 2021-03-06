"########################################################################
"#
"#
"#
"########################################################################

" Basics {
   set nocompatible " explicitly get out of vi-compatible mode
   set noexrc " don't use local version of .(g)vimrc, .exrc
   set background=dark " we plan to use a dark background
   " set cpoptions=aABceFsmq
   "             |||||||||
   "             ||||||||+-- When joining lines, leave the cursor
   "             |||||||      between joined lines
   "             |||||||+-- When a new match is created (showmatch)
   "             ||||||      pause for .5
   "             ||||||+-- Set buffer options when entering the
   "             |||||      buffer
   "             |||||+-- :write command updates current file name
   "             ||||+-- Automatically add <CR> to the last line
   "             |||      when using :@r
   "             |||+-- Searching continues at the end of the match
   "             ||      at the cursor position
   "             ||+-- A backslash has no special meaning in mappings
   "             |+-- :write updates alternative file name
   "             +-- :read updates alternative file name
   syntax on " syntax highlighting on
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    ""set autochdir " always switch to the current file directory
    set backspace=indent,eol,start " make backspace a more flexible
    set nobackup " make backup files
    "set backupdir=~/.vim/backup " where to put backup files
    ""set clipboard+=unnamed " share windows clipboard
    ""set directory=~/.vim/tmp " directory to place swap files in
    "set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    set mouse-=a " use mouse everywhere
    set mousehide " hide the mouse cursor when typing
    set noerrorbells " don't make noise
    ""set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list
" }

" Vim UI {
    "set cursorcolumn " highlight the current column
    "set cursorline " highlight current line
    set incsearch " BUT do highlight as you type you
                   " search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines
                     " betweens rows
    ""set list " we do what to show tabs, to ensure we get them
              " out of my files
    ""set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink
                     " matching brackets for
    set hlsearch " highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set vb t_vb=
    set virtualedit=all

    set nonumber " turn on line numbers
    "set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
    " colorscheme molokai " my color scheme (only works in GUI)
    " colorscheme solarized
    " Modeline
    set modeline
    set modelines=5
    set splitbelow
    set splitright

" }

" Text Formatting/Layout {
    ""set completeopt= " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return,
                          " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set wrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent,
                      " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                       "should a tab be (see expandtab)
    set tabstop=8 " real tabs should be 8, and they will show with
                   " set list on
" }

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default
                        " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still
                      " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds
    function! SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function
                                   " (cleaner than default)
" }

" Plugin Management {
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
    " let Vundle manage Vundle
    Bundle 'gmarik/vundle'

    " My Bundles here:
    "
    " Tab alignment and Text filtering
    Bundle 'godlygeek/tabular'

    Bundle 'tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'mattn/zencoding-vim'

    " Syntax highlight
    Bundle "cucumber.zip"
    Bundle "Markdown"
    Bundle 'wavded/vim-stylus'


    " (HT|X)ml tool
    Bundle "tpope/vim-ragtag"
 
    " Utility
    Bundle 'scrooloose/nerdtree'
    Bundle 'Lokaltog/vim-powerline'
    Bundle "repeat.vim"
    Bundle "surround.vim"
    Bundle "SuperTab"
    Bundle "file-line"
    Bundle "Align"
                    
    Bundle 'L9'
    Bundle "FuzzyFinder"

    Bundle 'taglist.vim' 
    Bundle 'c.vim' 
    Bundle 'a.vim' 
    Bundle 'grep.vim' 
    Bundle 'python_fold' 
    Bundle 'Pydiction' 


    " ack.vim : Plugin for the Perl module / CLI script 'ack'
    " must install: sudo apt-get install ack-grep
    Bundle "mileszs/ack.vim"
    noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
    vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

    " Bundle 'git://git.wincent.com/command-t.git'
" }
   
" Plugin Settings {
    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars=1 " highlight advanced perl vars
                              " inside strings

    " TagList Settings {
        let Tlist_Auto_Open=0 " let the tag list open automagically
        let Tlist_Compact_Format = 1 " show small menu
        let Tlist_Ctags_Cmd = 'ctags' " location of ctags
        let Tlist_Enable_Fold_Column = 0 " do show folding tree
        let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill
                                        " yourself
        let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
        let Tlist_Sort_Type = "name" " order by
        let Tlist_Use_Right_Window = 1 " split to the right side
                                        " of the screen
        let Tlist_WinWidth = 30 " 40 cols wide, so i can (almost always)
                                 " read my functions
        " Language Specifics {
        " just functions and classes please
        let tlist_aspjscript_settings = 'asp;f:function;c:class' 
        " just functions and subs please
        let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
        " don't show variables in freaking php
        let tlist_php_settings = 'php;c:class;d:constant;f:function' 
        " just functions and classes please
        let tlist_vb_settings = 'asp;f:function;c:class' 
        " }
    " }
   
    " Pathogen {
        call pathogen#infect() 
    " }

    " cvim {
        let g:C_AuthorName = 'Seraphim'
        let g:C_AuthorRef  = 'Hj'
        let g:C_Email   = 'hj1986@gmail.com'
        let g:C_Company  = 'Baidu Inc.'
    " }

    " quickfix setting {
    "    function QfMakeConv()
    "       let qflist = getqflist()
    "       for i in qflist
    "          let i.text = iconv(i.text, "cp936", "utf-8")
    "       endfor
    "       call setqflist(qflist)
    "    endfunction
    "    au QuickfixCmdPost make call QfMakeConv()
    " }

    " pydiction setting {
        let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
        if has("autocmd")
            autocmd FileType python set complete+=k~/.vim/bundle/Pydiction/
        endif
        let g:pydiction_menu_height = 20 
    " }
    " powerline{
        " set guifont=PowerlineSymbols\ for\ Powerline
        set t_Co=256
        let g:Powerline_symbols = 'fancy'
    " }
" }

" Mappings {
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
nmap <leader>w :w!<cr>
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful when moving accross long lines
map j gj
map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <space> <C-f>
map <S-space> <C-b>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" nnoremap <silent> <F4> :tabprevious<CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-
" cscope add ~/code/cscope/cscope.out
nnoremap <silent> <F3> :Grep<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Duplication
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP
 
" Split line(opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew 
 
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap < <><ESC>i
"inoremap > <c-r>=ClosePair('>')<CR>

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
       return a:char
    endif
endf
map <C-a> ggVG

" Vim grep jump to next error in quickfix
" map <F4> <ESC>:cn<cr>
" map <F3> <ESC>:cp<cr>
map ,n <ESC>:cn<cr>
map <LocalLeader>p <ESC>:cp<cr>

" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR> 

" }


" Autocommands {
    " Ruby {
        " ruby standard 2 spaces, always
        au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
        au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 
    " }
    " Javascript{
        " js standard 2 spaces, always
        au BufRead,BufNewFile *.js set shiftwidth=2 
        au BufRead,BufNewFile *.js set softtabstop=2 
    " }
    " Notes {
        " I consider .notes files special, and handle them differently, I
        " should probably put this in another file
        au BufRead,BufNewFile *.notes set foldlevel=2
        au BufRead,BufNewFile *.notes set foldmethod=indent
        au BufRead,BufNewFile *.notes set foldtext=foldtext()
        au BufRead,BufNewFile *.notes set listchars=tab:\ \
        au BufRead,BufNewFile *.notes set noexpandtab
        au BufRead,BufNewFile *.notes set shiftwidth=8
        au BufRead,BufNewFile *.notes set softtabstop=8
        au BufRead,BufNewFile *.notes set tabstop=8
        au BufRead,BufNewFile *.notes set syntax=notes
        au BufRead,BufNewFile *.notes set nocursorcolumn
        au BufRead,BufNewFile *.notes set nocursorline
        au BufRead,BufNewFile *.notes set spell
    " }
    au BufNewFile,BufRead *.ahk setf ahk 

    " Python {
        au BufNewFile, BufRead *.py, .pyw setf python
    " }
" }

" GUI Settings {
if has("gui_running")
    " Basics {
        if has("win32")
            au GUIEnter * simalt ~x
        endif
        " colorscheme metacosm " my color scheme (only works in GUI)
        colorscheme molokai " my color scheme (only works in GUI)
        set columns=190 " perfect size for me
        " set guifont=Monaco\ 12 " My favorite font
        set guioptions=ce 
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set lines=80 " perfect size for me
        set guioptions-=T
    " }

endif
" }
"
"


