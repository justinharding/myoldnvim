set nocompatible

" ---------------- general ---------------
" use relative line numbering
set relativenumber
" except for the current line
set number

" set backspace=indent,eol,start
set showmode
" set gcr=n:blinkon0
set visualbell t_vb=
set hidden
set history=100
set termguicolors
" set encoding=utf8

let mapleader = ','

set shell=/usr/local/bin/zsh
" ---------------- swap files ---------------
set noswapfile
set nobackup
set nowb

" ---------------- indentation ---------------
filetype indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent

set list

set nowrap
set linebreak

" ---------------- clipboard ---------------
set clipboard=unnamed
nnoremap <Leader>p "+]p
nnoremap <Leader>P "+]P

nnoremap <Leader>y ma^"+y$`a
nnoremap <Leader>c ^"+c$
nnoremap <Leader>d ^"+d$

vnoremap <Leader>y "+y
vnoremap <Leader>c "+c
vnoremap <Leader>d "+d

" ---------------- search ---------------
set hlsearch
set ignorecase
set smartcase
set showmatch

" ---------------- status line ---------------
" set statusline=%f
" set statusline+=\ %h%w%m%r
" set statusline+=%=
" set statusline+=%-16(%{exists('g:loaded_fugitive')?fugitive#statusline():''}\%)
" set statusline+=\ %P/%L
" set statusline+=\

" ---------------- airline status bar ---------------
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

" ---------------- git commit messages ---------------
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

" ---------------- terminal  ---------------
:noremap <C-[> <C-\><C-n>
" :tnoremap <A-h> <C-\><C-n><C-w>h
" :tnoremap <A-j> <C-\><C-n><C-w>j
" :tnoremap <A-k> <C-\><C-n><C-w>k
" :tnoremap <A-l> <C-\><C-n><C-w>l
" :nnoremap <A-h> <C-w>h
" :nnoremap <A-j> <C-w>j
" :nnoremap <A-k> <C-w>k
" :nnoremap <A-l> <C-w>l

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
:tnoremap <Esc> <C-\><C-n>
:tnoremap <C-[> <C-\><C-n>
:tnoremap <<C-h> <C-\><C-n><C-w>h
:tnoremap <<C-j> <C-\><C-n><C-w>j
:tnoremap <<C-k> <C-\><C-n><C-w>k
:tnoremap <<C-l> <C-\><C-n><C-w>l
:nnoremap <<C-h> <C-w>h
:nnoremap <<C-j> <C-w>j
:nnoremap <<C-k> <C-w>k
:nnoremap <<C-l> <C-w>l

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

set splitbelow
set splitright

" ---------------- other ---------------
:imap <c-[> <esc>

:imap … <esc>
:imap <a-;> <esc>
:nnoremap <C-^> :b#<cr>
:nnoremap <esc> :noh<cr><esc>
:nnoremap … :noh<cr><esc>
:nnoremap <m-;> :noh<cr><esc>

" nerdtree
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>v :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"set noerrorbeLls visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

map <leader>s :source ~/.vimrc<CR>

" ---------------- syntax highlighting ---------------
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'

" ---------------- files ---------------
nnoremap <Leader><Leader> :e#<CR>

" ---------------- matchit ---------------
runtime macros/matchit.vim          " enable matchit (better '%' key mapping)

" ---------------- nerd commenter ---------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ---------------- clang formatting ---------------
map <c-k> :pyf /usr/local/Cellar/clang-format/2018-01-11/share/clang/clang-format.py<cr>
imap <c-k><c-o> :pyf /usr/local/Cellar/clang-format/2018-01-11/share/clang/clang-format.py<cr>

" map <A-K> :pyf /usr/local/Cellar/llvm/HEAD/share/clang/clang-format.py<cr>
" imap <A-K> <a-o> :pyf /usr/local/Cellar/llvm/HEAD/share/clang/clang-format.py<cr>

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>pyf /usr/local/Cellar/clang-format/2018-01-11/share/clang/clang-format.py<cr>
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>pyf /usr/local/Cellar/llvm/HEAD/share/clang/clang-format.py<cr> autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :pyf /usr/local/Cellar/llvm/HEAD/share/clang/clang-format.py<cr>
" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>
" ---------------- plugins ---------------
call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'arakashic/chromatica.nvim'
Plug 'lifepillar/vim-solarized8'
Plug 'sts10/vim-mustard'
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jacoborus/tender.vim'
Plug 'OrangeT/vim-csharp'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'PProvost/vim-ps1'
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'

let g:indentLine_char = '⎸'

call plug#end()

autocmd BufEnter *.cpp,*.h,*.hpp :let b:commentary_format="// %s"

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

nnoremap <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
            \ ? substitute(g:colors_name, 'dark', 'light', '')
            \ : substitute(g:colors_name, 'light', 'dark', '')
            \ )<cr>

fun! Solarized8Contrast(delta)
  let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
  exe "colors" l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endf

nmap <leader>- :<c-u>call Solarized8Contrast(-v:count1)<cr>
nmap <leader>+ :<c-u>call Solarized8Contrast(+v:count1)<cr>

" ------------- ctrlp --------------
let g:ctrlp_cmd = 'CtrlPBuffer'

" ------------- vim-jsx --------------
let g:jsx_ext_required = 0

" ------------- colours and fonts --------------
" set guifont=Meslo\ LG\ M\ for\ Powerline:h10
" set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h10
" if has("gui_running")
"     "  colorscheme macvim
"     set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h9
"     " set guifont=Monaco:h10
"     set background=light
" else
"     set background=light
" endif
set background=dark
" colorscheme base16-default-dark
colorscheme gruvbox
" colorscheme tender
" colorscheme solarized
" colorscheme mustard
" colorscheme solarized8_light

let g:sneak#label = 1

" use ag for greplike searching instead of ack - ag is faster
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

