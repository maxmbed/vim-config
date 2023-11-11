" Editor rules
" Make visible space and tab with dot
set lcs+=space:·
"Use 'set list' to show. 'set nolist' to remove

" Ensure tab key instert spaces
set expandtab
set tabstop=2
set shiftwidth=2

" Show line number
set number

" Status bar config
" Show current file name
set laststatus=2

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\row:\ %l\ col:\ %c\ percent:\ %p%%

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type
filetype plugin on
" Turn syntax highlighting on.
syntax on


" Do not save backup files.
set nobackup
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line
set showmode
" Show matching words during a search.
set showmatch
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.  Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.fifo

" Convert escape sequence of screen-term into proper Ctrl-<arrow>
if &term == "screen"
  map <Esc>[1;5C <C-Right>
  map <Esc>[1;5D <C-Left>
  map <Esc>[1;6C <C-Right>
  map <Esc>[1;6D <C-Left>
  inoremap <Esc>[1;5C <C-Right>
  inoremap <Esc>[1;5D <C-Left>
  inoremap <Esc>[1;6C <C-Right>
  inoremap <Esc>[1;6D <C-Left>
endif

" Navigate in vim split
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

"NERDTREE
" Open NERDTree with C-F
nmap <C-f> :NERDTreeToggle<CR>

"start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


call plug#begin()

    Plug 'preservim/nerdtree'
    Plug 'wsdjeg/vim-fetch'

call plug#end()
