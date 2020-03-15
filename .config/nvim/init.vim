" variables {{{
  let mapleader = " "
  let $vim_config = '~/.config/nvim/init.vim'
" }}}
" plugins {{{
  call plug#begin('~/.vim/plugged')
  " visual plugins {{{
    " goyo {{{
      Plug 'junegunn/goyo.vim'
      autocmd! User GoyoEnter Limelight
      autocmd! User GoyoLeave Limelight!
      nnoremap <silent> <F11> :Goyo<bar>set linebreak<cr>
    " }}}
    " limelight {{{
      Plug 'junegunn/limelight.vim'
      let g:limelight_conceal_ctermfg = 240
    " }}}
    Plug 'ap/vim-css-color'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'vim-airline/vim-airline'
    " nerd tree {{{
      Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
      Plug 'preservim/nerdtree'
      " let NERDTreeShowHidden=1
      nnoremap <leader>n :NERDTreeToggle<cr>
    " }}}
  " }}}
  " command plugins {{{
    " vim-math {{{
      Plug 'nixon/vim-vmath'
      vnoremap <expr>  ++  VMATH_YankAndAnalyse()
      nnoremap         ++  vip++
    " }}}
    " vim objects {{{
      " Plug 'wellle/targets.vim' " issue #246
      Plug 'tpope/vim-commentary'
      Plug 'tpope/vim-surround'
      Plug 'kana/vim-textobj-user'
      Plug 'kana/vim-textobj-indent'
      Plug 'kana/vim-textobj-line'
      Plug 'kana/vim-textobj-entire'
    " }}}
    " fzf {{{
      Plug 'junegunn/fzf', {'do': './install --bin' }
      Plug 'junegunn/fzf.vim'
      nnoremap <silent> <leader>b :Buffers<cr>
      nnoremap <silent> <leader>f :Files<cr>
    " }}}
  " }}}
  " syntax plugins {{{
    Plug 'fatih/vim-go'
    Plug 'dag/vim-fish'
    Plug 'xolox/vim-misc'
    Plug 'jreybert/vimagit'
    Plug 'vim-scripts/lua.vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'neovim/nvim-lsp'
    " mucomplete {{{
      Plug 'lifepillar/vim-mucomplete'
      set completeopt+=menuone,noselect,longest
      set completeopt-=preview
      set shortmess+=c
    " }}}
  " }}}
  call plug#end()
  nnoremap <leader>pi :PlugInstall<cr>
  nnoremap <leader>pu :PlugUpdate<cr>
" }}}
" ui {{{
  " basics {{{
    syntax on
    filetype plugin on
    set encoding=utf-8
    set background=dark
    set termguicolors& " should probably set this up
    " colorscheme name " should create my own...
    set scrolloff=5
    set number
    set relativenumber
    set ignorecase
    set smartcase
    set wrap
    set linebreak
    " set textwidth=80 " auto creates <eol>
    set laststatus=0   " who needs a status line
  " }}}
  " tabs {{{
    set shiftround
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
    set expandtab
  " }}}
  " special characters {{{
    set list
    set showbreak=↪\
    set listchars=tab:‹-›,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
    set fillchars=vert:\ ,fold:\ ,foldopen:\ ,foldclose:\ ,eob:x
  " }}}
" }}}
" highlighting {{{
  " word highlighter {{{
    " copied from Steve Losh
    function! HighlightWord(n)
        normal! mz"zyiw
        let match_id = 97531 + a:n
        silent! call matchdelete(match_id)
        let word_pattern = '\V\<'.escape(@z, '\').'\>'
        call matchadd("highlightedword".a:n, word_pattern, 1, match_id)
        normal! `z
    endfunction

    nnoremap <silent> <leader>1 :call HighlightWord(1)<cr>
    nnoremap <silent> <leader>2 :call HighlightWord(2)<cr>
    nnoremap <silent> <leader>3 :call HighlightWord(3)<cr>
    nnoremap <silent> <leader>4 :call HighlightWord(4)<cr>
    nnoremap <silent> <leader>5 :call HighlightWord(5)<cr>
    nnoremap <silent> <leader>6 :call HighlightWord(6)<cr>

    highlight highlightedword1 ctermfg=16 ctermbg=214
    highlight highlightedword2 ctermfg=16 ctermbg=154
    highlight highlightedword3 ctermfg=16 ctermbg=121
    highlight highlightedword4 ctermfg=16 ctermbg=160
    highlight highlightedword5 ctermfg=16 ctermbg=211
    highlight highlightedword6 ctermfg=16 ctermbg=195
  " }}}
  set cursorline
  call matchadd('ColorColumn', '\%81c') " set colorcolumn=+1
  highlight cursorline    ctermbg=234 cterm=NONE
  highlight nontext       ctermfg=236
  highlight whitespace    ctermfg=236
  highlight pmenu         ctermbg=150
  highlight pmenu         ctermfg=0
  highlight pmenusel      ctermbg=180
  highlight pmenusel      ctermfg=230
  highlight incsearch     ctermfg=4   ctermbg=0
" }}}
" file finder {{{
  set path=.,,**
  set complete-=i
  set wildmenu
  set wildmode=longest:full,full
  set wildignore+=**/node_modules/**                " javascript modules
  set wildignore+=**/env/**                         " python environment
  set wildignore+=.hg,.git,.svn                     " Version control
  set wildignore+=*.aux,*.out,*.toc                 " LaTeX intermediate files
  set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
  set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
  set wildignore+=*.sw?                             " Vim swap files
" }}}
" window splits{{{
  set hidden
  set splitbelow splitright
  map <c-h> <c-w>h
  map <c-j> <c-w>j
  map <c-k> <c-w>k
  map <c-l> <c-w>l
  map <c-m-h> <c-w>H
  map <c-m-j> <c-w>J
  map <c-m-k> <c-w>K
  map <c-m-l> <c-w>L
" }}}
" commands {{{
  " common {{{
    nnoremap ' `
    nnoremap * *N
    nnoremap j gj
    nnoremap k gk
    nnoremap gj j
    nnoremap gk k
    nnoremap Y y$
  " }}}
  " heresy {{{
    map  <c-s>      :w<cr>
    map  <c-c>      "+y
    map  <c-v>      "+p
    imap <c-s> <esc>:w<cr>a
    imap <c-c> <esc>"+y
    imap <c-v> <esc>"+pa
    noremap! <c-a> <home>
    noremap! <c-e> <end>
  " }}}
  " useful {{{
    map  <F1> <nop>
    imap <F1> <esc>
    nnoremap <c-p> "+p
    nnoremap <cr> moo<esc>`o
    nnoremap c* *Ncgn
    inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
    inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"
    nnoremap vb <c-v>
  " }}}
  " leader {{{
    " fold everything except current line
    nnoremap <leader>z zMzvzz
    " clear last command
    nnoremap <leader>l :echo<cr>
    " panic button - ROT13 whole file
    nnoremap <space><space> mzggg?G`z

    nnoremap <silent> <leader>o :setlocal spell! spelllang=en_us<cr>
    nnoremap <silent> <leader>/ :noh<cr>
  " }}}
  " specific files {{{
    nnoremap <silent> <leader>ev   :vsp    $vim_config<cr>
    nnoremap <silent> <leader>sv m":source $vim_config<cr>
  " }}}
" }}}
" training commands {{{
  nnoremap `` :echo "use ''"<cr>
" }}}
" backups {{{
set backup                        " enable backups
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}
" auto commands {{{
 " autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

 " kludgy but works
  set fo-=c fo-=r fo-=o fo+=1 fo+=t

  " remove trailing spaces upon saving
  autocmd BufWritePre * %s/\s\+$//e

  " reload .Xresources, should probably do it with 'entr' though
  autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

  " when opening a file position the cursor to where it last was
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
    \   execute 'normal! g`"zvzz' |
    \ endif
" }}}
" abbreviations {{{
  iabbrev todo TODO
" }}}
" snippets {{{
" }}}
" Filetype specific {{{
" C {{{
augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
    au FileType c setlocal ts=8 sts=8 sw=8 noexpandtab
augroup END
" }}}
" C++ {{{
augroup ft_cpp
    au!
    au FileType cpp setlocal foldmethod=marker foldmarker={,}
    au FileType cpp setlocal ts=8 sts=8 sw=8 noexpandtab
augroup END
" }}}
" }}}
" TODO {{{
  " sometimes when I yiw or ciw it selects the whole fold??
  " tab sometimes not working in insert mode
  " unfold zv line after folding has taken place
  " Language Server Protocol, Linter, autocomplete etc.
  " lua highlighting in vimrc
  " custom highlighting of words under the cursor
  " command for :call clearmatches() that clears only one type of a match
  "                  as I don't want to clear the colorcolumn hack I use
  " undo tree visualizer
  " stop using swap files, start using backups
  " managing swap file to open diff in two windows
  " add a bunch of training commands
  " add a bunch of abbreviations
  " startify config
  " normal regexes nnoremap / /\v
" }}}
" LSP settings {{{
lua << EOF
require'nvim_lsp'.pyls.setup{}
local nvim_lsp = require('nvim_lsp')
local buf_set_keymap = vim.api.nvim_buf_set_keymap

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.

  local opts = { noremap=true, silent=true }
  buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '[I', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap(bufnr, 'n', ',e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
end

local servers = {'gopls', 'rust_analyzer', 'sumneko_lua', 'tsserver', 'pyls'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  }
end
EOF
" Set up mucomplete
  let g:mucomplete#enable_auto_at_startup = 0
  set completeopt+=noinsert,noselect
  syntax region par1 matchgroup=luaCode start="^lua << EOF$" end="^EOF$"
  highlight luaCode ctermfg=14
" }}}
" text objects {{{
  " folds {{{
    " onoremap iz :<c-u>normal! [z0jV]zk<cr>
    " onoremap az :<c-u>normal! [zV]z<cr>
    " vnoremap iz :<c-u>normal! [z0jV]zk<cr>
    " vnoremap az :<c-u>normal! [zV]z<cr>
    " onoremap if :<c-u>normal! [z0jV]zk<cr>
    " onoremap af :<c-u>normal! [zV]z<cr>
    " vnoremap if :<c-u>normal! [z0jV]zk<cr>
    " vnoremap af :<c-u>normal! [zV]z<cr>
  " }}}
" }}}
" folding {{{
  set foldenable
  set foldlevelstart=0
  set foldnestmax=10
" }}} vim: fdm=marker fdl=0
