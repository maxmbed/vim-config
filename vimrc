" Editor rules
set lcs+=space:·
set expandtab
set tabstop=2
set shiftwidth=2
set number
set nobackup
set showcmd   " Show partial command
set showmode  " Show the mode you are on the last line
set showmatch " Show matching words during a search.
set hlsearch  " Higlight search
filetype on
filetype plugin on
syntax on

" Bar rules
set statusline+=\ %F\ %M\ %Y\ %R " Status line left side.
set statusline+=%=               " Use a divider to separate left from the right side
set statusline+=\row:\ %l\ col:\ %c\ percent:\ %p%% " Status line right side.
set laststatus=2   " Show current file name

" Convert escape sequence of screen|tmux-term into proper Ctrl-<arrow> input
if &term =~ '^\%(screen\|tmux\)'
  map <Esc>[1;5C <C-Right>
  map <Esc>[1;5D <C-Left>
  map <Esc>[1;6C <C-Right>
  map <Esc>[1;6D <C-Left>
  inoremap <Esc>[1;5C <C-Right>
  inoremap <Esc>[1;5D <C-Left>
  inoremap <Esc>[1;6C <C-Right>
  inoremap <Esc>[1;6D <C-Left>
endif

" Editor split navigation
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

call plug#begin()

    Plug 'preservim/nerdtree'
    Plug 'wsdjeg/vim-fetch'
    Plug 'junegunn/vim-github-dashboard'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'nordtheme/vim'

call plug#end()

" Color scheme
if filereadable(expand("~/.vim/plugged/vim/colors/nord.vim"))
  colorscheme nord
  let g:nord_uniform_diff_background = 1 " https://github.com/nordtheme/vim/pull/61
endif

" Nerdtree rules
if exists('ide') " ide mode: vim --cmd 'let ide=1'
  if filereadable(expand("~/.vim/plugged/nerdtree/autoload/nerdtree.vim"))
    nmap <C-t> :NERDTreeToggle<CR>
  
    " Start Nerdtree and leave the cursor in it.
    autocmd VimEnter * NERDTree | wincmd p
  
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  endif
  
  if filereadable(expand("~/.config/coc/coc-config"))
    source ~/.config/coc/coc-config
  endif
endif
