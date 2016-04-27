set nocompatible

filetype off
call pathogen#infect()
call pathogen#helptags()
filetype on

filetype plugin indent on
syntax on

set backspace=indent,start,eol

set encoding=utf-8
set fileencodings=utf-8,cp932,iso-2022-jp
set completeopt=preview

set history=100
set incsearch
set laststatus=2
set matchtime=1

set nrformats=octal,hex,alpha
set pastetoggle=<F10>
set ruler
set scrolloff=3
set shiftround
set showcmd
set showmatch

set t_RV=

set tabstop=4
set softtabstop=4
set shiftwidth=4

set updatecount=50

let loaded_matchparen = 1
let g:netrw_browse_split = 1

map ,s :w<CR>
map ,q :q<CR>
map ,w :x<CR>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

nmap <silent> <F6> :set number!<CR>
nmap gf :new %:p:h/<cfile><CR>

set statusline=%#Visual#%{fugitive#statusline()}%#LineNr#\ %<%f%#Keyword#%m%#LineNr#%r%H%W\ %=%#Visual#\ %l/%L\ %#Normal#%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}

set t_Co=256
colorscheme railscasts

set number
set noequalalways
set nobackup
set smartindent
set autoindent

map + <C-W>+
map - <C-W>-
nnoremap < <C-W><
nnoremap > <C-W>>

nnoremap j gj
nnoremap k gk

set ambiwidth=double
set formatoptions=mMql
set textwidth=0

set visualbell
set visualbell t_vb=

set hlsearch

set foldmethod=marker
set foldlevel=0
set foldnestmax=1

au BufRead,BufNewFile *.feature set filetype=cucumber
au BufRead,BufNewFile Capfile set filetype=ruby

set foldtext=MyFoldText()
function MyFoldText()
    let line_number = v:foldstart
    let sub = ""
    let prefix = ""
    if match(getline(line_number), '^[[:blank:]]*/\*') >= 0
        let prefix = "// "
    endif
    while line_number < v:foldend && strlen(sub) == 0
        let line = getline(line_number)
        let sub = substitute(line, '^[[:blank:]*]\+\|\s\+$\|\/\/\|#\|\/\*\+\s*\|\s*\*\+\/\|{{{\d\=\|function \|def ', '', 'g')
        if match(sub, '^\s*$') == 0
            let sub = ""
        endif
        let line_number = line_number + 1
    endwhile

    let lines = v:foldend - v:foldstart + 1

    return "+-" . v:folddashes . lines . ": " . prefix . sub
endfunction

" vim:set foldmethod=manual :
