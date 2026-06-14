" Modern, plugin-free Vim configuration
" Target: Vim 8.2+ / Vim 9.x

if exists('g:loaded_modern_vimrc')
  finish
endif
let g:loaded_modern_vimrc = 1

scriptencoding utf-8
set nocompatible
filetype plugin indent on
syntax enable

" Core behavior
let mapleader = ' '
let maplocalleader = ','
set hidden
set autoread
set confirm
set mouse=a
set clipboard^=unnamed,unnamedplus
set backspace=indent,eol,start
set switchbuf=useopen,usetab,newtab
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set completeopt=menuone,noselect
set complete=.,w,b,u,t,i
set updatetime=300
set timeoutlen=500
set ttimeoutlen=20
set history=1000

" Display
set number
set relativenumber
set cursorline
set signcolumn=yes
set showmatch
set showcmd
set laststatus=2
set noshowmode
set cmdheight=1
set shortmess+=c
set display+=lastline
set scrolloff=5
set sidescrolloff=5
set splitbelow
set splitright
set nowrap
set linebreak
set breakindent
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:+
set termguicolors
set background=dark

" Built-in Gotham colors, adapted from https://github.com/whatyouhide/vim-gotham
" Copyright (c) 2014 Andrea Leopardi, MIT License
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'modern-gotham-builtin'

let g:terminal_ansi_colors = [
      \ '#0c1014', '#c23127', '#2aa889', '#edb443',
      \ '#195466', '#4e5166', '#33859e', '#99d1ce',
      \ '#11151c', '#c23127', '#2aa889', '#edb443',
      \ '#195466', '#4e5166', '#33859e', '#d3ebe9',
      \ ]

highlight Normal       guifg=#99d1ce guibg=#0c1014 ctermfg=7  ctermbg=0
highlight Cursor       guifg=#11151c guibg=#99d1ce ctermfg=8  ctermbg=7
highlight CursorLine                  guibg=#11151c            ctermbg=8
highlight CursorColumn                guibg=#11151c            ctermbg=8
highlight LineNr       guifg=#195466 guibg=#11151c ctermfg=4  ctermbg=8
highlight CursorLineNr guifg=#599cab guibg=#11151c ctermfg=14 ctermbg=8
highlight SignColumn                  guibg=#11151c            ctermbg=8
highlight ColorColumn                 guibg=#11151c            ctermbg=8
highlight Visual                      guibg=#0a3749            ctermbg=12
highlight Comment      guifg=#195466               ctermfg=4
highlight String       guifg=#2aa889               ctermfg=2
highlight Number       guifg=#d26937               ctermfg=9
highlight Statement    guifg=#599cab               ctermfg=14
highlight Special      guifg=#d26937               ctermfg=9
highlight Identifier   guifg=#599cab               ctermfg=14
highlight Constant     guifg=#888ca6               ctermfg=13
highlight Title        guifg=#d26937               ctermfg=9
highlight Underlined   guifg=#edb443 gui=underline ctermfg=3 cterm=underline
highlight Type         guifg=#d26937               ctermfg=9
highlight PreProc      guifg=#c23127               ctermfg=1
highlight NonText      guifg=#195466               ctermfg=4
highlight EndOfBuffer  guifg=#11151c               ctermfg=8
highlight Conceal      guifg=#33859e guibg=#0c1014 ctermfg=6  ctermbg=0
highlight Todo         guifg=#888ca6 guibg=#0c1014 ctermfg=13 ctermbg=0
highlight VertSplit    guifg=#195466 guibg=#11151c ctermfg=4  ctermbg=8
highlight StatusLine   guifg=#599cab guibg=#091f2e ctermfg=14 ctermbg=10
highlight StatusLineNC guifg=#195466 guibg=#091f2e ctermfg=4  ctermbg=10
highlight MatchParen   guifg=#99d1ce guibg=#d26937 ctermfg=7  ctermbg=9
highlight SpecialKey   guifg=#0a3749               ctermfg=12
highlight Folded       guifg=#99d1ce guibg=#195466 ctermfg=7  ctermbg=4
highlight FoldColumn   guifg=#599cab guibg=#0a3749 ctermfg=14 ctermbg=12
highlight Search       guifg=#091f2e guibg=#edb443 ctermfg=10 ctermbg=3
highlight IncSearch    gui=reverse cterm=reverse
highlight CurSearch    guifg=#091f2e guibg=#edb443 ctermfg=10 ctermbg=3
highlight Pmenu        guifg=#99d1ce guibg=#091f2e ctermfg=7  ctermbg=10
highlight PmenuSel     guifg=#d3ebe9 guibg=#195466 ctermfg=15 ctermbg=4
highlight PmenuSbar                   guibg=#091f2e            ctermbg=10
highlight PmenuThumb                  guibg=#195466            ctermbg=4
highlight ErrorMsg     guifg=#c23127 guibg=#11151c ctermfg=1  ctermbg=8
highlight Error        guifg=#c23127 guibg=#11151c ctermfg=1  ctermbg=8
highlight ModeMsg      guifg=#195466               ctermfg=4
highlight WarningMsg   guifg=#c23127               ctermfg=1
highlight WildMenu     guifg=#d3ebe9 guibg=#33859e ctermfg=15 ctermbg=6
highlight Question     guifg=#2aa889               ctermfg=2
highlight TabLineSel   guifg=#d3ebe9 guibg=#195466 ctermfg=15 ctermbg=4
highlight TabLine      guifg=#99d1ce guibg=#091f2e ctermfg=7  ctermbg=10
highlight TabLineFill  guifg=#0c1014 guibg=#0c1014 ctermfg=0  ctermbg=0
highlight SpellBad     guifg=#d3ebe9 guibg=#c23127 ctermfg=15 ctermbg=1
highlight SpellCap     guifg=#d3ebe9 guibg=#195466 ctermfg=15 ctermbg=4
highlight SpellLocal   guifg=#edb443               ctermfg=3
highlight SpellRare    guifg=#d3ebe9 guibg=#4e5166 ctermfg=15 ctermbg=5
highlight DiffAdd      guifg=#d3ebe9 guibg=#2aa889 ctermfg=15 ctermbg=2
highlight DiffChange   guifg=#d3ebe9 guibg=#195466 ctermfg=15 ctermbg=4
highlight DiffDelete   guifg=#d3ebe9 guibg=#c23127 ctermfg=15 ctermbg=1
highlight DiffText     guifg=#d3ebe9 guibg=#33859e ctermfg=15 ctermbg=6
highlight Directory    guifg=#33859e               ctermfg=6
highlight MsgArea      guifg=#d3ebe9 guibg=#11151c ctermfg=15 ctermbg=8

" GVim-specific appearance and desktop-friendly shortcuts
if has('gui_running')
  set title
  set lines=40
  set columns=120
  set guioptions-=T
  set guioptions-=L
  set guioptions-=R
  set guioptions-=l
  set guioptions-=r
  set guioptions-=b
  set guitablabel=%t
  set mousemodel=popup_setpos
  if has('win32') || has('win64')
    set guifont=Consolas:h11
  else
    set guifont=Monospace\ 11
  endif
endif

" Editing
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smartindent
set autoindent
set formatoptions-=t
set formatoptions+=j
set virtualedit=block
set nrformats-=octal

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
if exists('+inccommand')
  set inccommand=split
endif

" Persistent state
let s:state_dir = empty($XDG_STATE_HOME)
      \ ? expand('~/.vim/state')
      \ : expand('$XDG_STATE_HOME/vim')
for s:dir in ['backup', 'swap', 'undo']
  call mkdir(s:state_dir . '/' . s:dir, 'p', 0700)
endfor
execute 'set backupdir^=' . fnameescape(s:state_dir . '/backup//')
execute 'set directory^=' . fnameescape(s:state_dir . '/swap//')
if has('persistent_undo')
  set undofile
  execute 'set undodir^=' . fnameescape(s:state_dir . '/undo//')
endif

" Built-in file browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" A compact, dependency-free status line
set statusline=%#StatusLine#
set statusline+=\ %f
set statusline+=%m%r%h%w
set statusline+=%=
set statusline+=%{&filetype==#''?'none':&filetype}
set statusline+=\ %{&fileencoding==#''?&encoding:&fileencoding}
set statusline+=\ %{&fileformat}
set statusline+=\ %l:%c
set statusline+=\ %p%%

" Convenient mappings
nnoremap <silent> <Esc> :nohlsearch<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>Q :quitall<CR>
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>n :set number! relativenumber!<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>z :set wrap!<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
nnoremap <leader>x :cclose<CR>
nnoremap <leader>o :copen<CR>

if has('gui_running')
  nnoremap <C-s> :write<CR>
  inoremap <C-s> <C-o>:write<CR>
  vnoremap <C-s> <Esc>:write<CR>gv
endif

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>

vnoremap < <gv
vnoremap > >gv
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv
xnoremap <leader>p "_dP
nnoremap Y y$

" Command-line and insert-mode completion
cnoremap <expr> <C-p> wildmenumode() ? "\<Left>" : "\<Up>"
cnoremap <expr> <C-n> wildmenumode() ? "\<Right>" : "\<Down>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-Space> pumvisible() ? "\<C-e>" : "\<C-n>"

" Terminal-mode escape and navigation
if has('terminal')
  tnoremap <Esc><Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

" Useful commands
command! TrimTrailingWhitespace
      \ let s:view = winsaveview() |
      \ keeppatterns %s/\s\+$//e |
      \ call winrestview(s:view)
command! ReloadVimrc source $MYVIMRC

augroup modern_vimrc
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   execute "normal! g`\"" |
        \ endif
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  autocmd FileType gitcommit,markdown,text setlocal wrap spell
  autocmd FileType make setlocal noexpandtab
  autocmd FileType help,qf,man nnoremap <buffer> q :close<CR>
  autocmd BufWritePre * if &modifiable && !&binary | silent! TrimTrailingWhitespace | endif
augroup END
