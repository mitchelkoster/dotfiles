"
" Key bindings
"

" esc in insert & visual mode
inoremap jk <esc>
vnoremap jk <esc>

" Center cursor when cycling through search matches
nnoremap n nzz
nnoremap N Nzz

"
" Basic Configuration
"
"

" Copy to clipboard register by default
set clipboard=unnamedplus
set clipboard+=unnamed

" Disable compatibility with VI
set nocompatible

" Don't store backups or swap files
set nobackup
set noswapfile

" Remove error sounds
set noerrorbells

" no visual bell & flash
" Also required for TMUX & VIM combo
set vb t_vb=

" Enable type file detection
filetype on

" Enable plugins
filetype plugin on

" Indent smartly set smartindent
set smartindent

" Enable syntax highlighting
syntax on

" Determine indent for file type
filetype indent on

" Do not wrap lines
set nowrap

" Room to keep between cursor and sides of screen 
set scrolloff=8
set sidescrolloff=8

"
" Coding Configuration
"
" Enable syntax highlighting
syntax on

" Set line numbers
set number

" Set relative line numbers
set relativenumber

" Set tab width
set tabstop=4 softtabstop=4

" Hightlight current line
set cursorline

" Set shift width to 4 spaces (a tab uses 4 spaces)
set shiftwidth=4

" Set tab width to 4 columns (a tab represents 4 spaces)
set tabstop=4

" Use space characters instead of tabs
set expandtab

"
" Seach
"

" Highlight characters as you type
set incsearch

" Ignore casing
set ignorecase

" Ignore 'ignore casing' when searching for Capital letters
set smartcase

" Show matching word during search
set showmatch

" Highlight during a search
set hlsearch

"
" Scripts
"

" Detect if running in TMUX for VIM pane navigation
" Detect if running in TMUX for VIM pane navigation
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
