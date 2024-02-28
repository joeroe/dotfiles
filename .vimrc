" Load plugins
call plug#begin()
  " Appearance
  Plug 'morhetz/gruvbox'
  " Interface
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/goyo.vim'
  " Languages
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'quarto-dev/quarto-vim'
call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Use gruvbox (dark)
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" Use relative line numbers
set number
set relativenumber

" Use soft indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Use British English
set spelllang=en_gb

" Highlight maximum line width
set colorcolumn=80

" Highlight all 
set hlsearch

" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Show word count in airline (for prosish file types)
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = get(g:, 'airline#extensions#wordcount#filetypes', 
      \ ['quarto'])

" Set custom keyboard shortcuts
nnoremap <C-n> :NERDTreeFocus<CR>
