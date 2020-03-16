""" vimrc
""" plugins
  call plug#begin('~/.vim/plugged')

  """ visual  plugins
    """ ap/vim-css-color
      Plug 'ap/vim-css-color'

    """ ryanoasis/vim-devicons
      Plug 'ryanoasis/vim-devicons'

    """ vim-airline/vim-airline
      " Plug 'vim-airline/vim-airline'

    """ junegunn/goyo.vim
      Plug 'junegunn/goyo.vim'
      autocmd! User GoyoEnter Limelight
      autocmd! User GoyoLeave Limelight!
      nnoremap <silent> <F11> :Goyo<bar>set linebreak<cr>

    """ junegunn/limelight.vim
      Plug 'junegunn/limelight.vim'
      let g:limelight_conceal_ctermfg = 240

    """ mhinz/vim-startify
      Plug 'mhinz/vim-startify'
      let g:startify_custom_header = ''

    """ preservim/nerdtree
      Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
      Plug 'preservim/nerdtree'
      " let NERDTreeShowHidden=1
      nnoremap <leader>n :NERDTreeToggle<cr>

  """ command plugins
    """ tpope/vim-repeat
      Plug 'tpope/vim-repeat'
      nnoremap <silent> <plug>PasteBelowLine o<esc>"+p:call repeat#set("\<plug>PasteBelowLine", v:count)<cr>
      nnoremap <silent> <plug>MoveLineDown ddp:call repeat#set("\<plug>MoveLineDown", v:count)<cr>
      nnoremap <silent> <plug>MoveLineUp ddkP:call repeat#set("\<plug>MoveLineUp", v:count)<cr>
      nnoremap <silent> <plug>IndentWord F a<tab><esc>w:call repeat#set("\<plug>IndentWord", v:count)<cr>
      nnoremap <silent> <plug>UnIndentWord F a<bs><esc>w:call repeat#set("\<plug>UnIndentWord", v:count)<cr>

    """ nixon/vim-vmath
      Plug 'nixon/vim-vmath'
      vnoremap <expr>  ++  VMATH_YankAndAnalyse()
      nnoremap         ++  vip++

    """ vim objects
      " Plug 'wellle/targets.vim' " issue #246
      Plug 'tpope/vim-commentary'
      Plug 'tpope/vim-surround'
      Plug 'kana/vim-textobj-user'
      Plug 'kana/vim-textobj-indent'
      Plug 'kana/vim-textobj-line'
      Plug 'kana/vim-textobj-entire'

    """ junegunn/fzf
      Plug 'junegunn/fzf', {'do': './install --bin' }
      Plug 'junegunn/fzf.vim'
      nnoremap <silent> <leader>b :Buffers<cr>
      nnoremap <silent> <leader>f :Files<cr>

  """ syntax  plugins
    Plug 'fatih/vim-go'
    Plug 'dag/vim-fish'
    Plug 'xolox/vim-misc'
    Plug 'jreybert/vimagit'
    Plug 'vim-scripts/lua.vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'neovim/nvim-lsp'

    """ mucomplete
      " Plug 'lifepillar/vim-mucomplete' " remap tab
      " let g:mucomplete#tab_when_no_results = 1
      " let g:mucomplete#enable_auto_at_startup = 0
      " set completeopt+=menuone,noselect,longest,noinsert
      " set completeopt-=preview
      " set shortmess+=c

  call plug#end()
  nnoremap <leader>pi :PlugInstall<cr>
  nnoremap <leader>pu :PlugUpdate<cr>

""" ui
  """ basics
    filetype plugin on
    set lazyredraw
    set encoding=utf-8
    set scrolloff=5
    set sidescrolloff=5
    set noshowmode
    set number
    set relativenumber
    set ignorecase
    set smartcase
    set visualbell
    set laststatus=0
    set helpheight=15
    set hidden
    set splitbelow
    set splitright

  """ colors
    syntax on
    set background=dark
    set termguicolors& " should probably set this up
    " colorscheme name " should create my own...

  """ tabs and wrapping
    set shiftround
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
    set expandtab
    set smarttab
    set wrap
    set breakindent
    set linebreak

  """ special characters
    set list
    set showbreak=↪\
    set listchars=tab:‹-›,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
    set fillchars=vert:\ ,fold:\ ,foldopen:#,foldclose:#,eob:x

""" highlighting
  """ word highlighter
    let g:word_id = 97531
    function! HighlightWord(n)
        normal! mz"zyiw
        silent! call matchdelete(g:word_id+a:n)
        let word_pattern = '\V\<'.escape(@z, '\').'\>'
        call matchadd("highlightedword".a:n, word_pattern, 1, g:word_id+a:n)
        normal! `z
    endfunction

    function! UnHighlightWords()
      for i in range(1, 6)
        silent! call matchdelete(g:word_id+i)
      endfor
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

  set cursorline
  call matchadd('ColorColumn', '\%81c') " set colorcolumn=+1
  highlight folded        ctermfg=248 ctermbg=236
  highlight cursorline                ctermbg=234 cterm=NONE
  highlight nontext       ctermfg=236
  highlight whitespace    ctermfg=236
  highlight pmenu         ctermbg=150
  highlight pmenu         ctermfg=0
  highlight pmenusel      ctermbg=180
  highlight pmenusel      ctermfg=230
  highlight incsearch     ctermfg=4   ctermbg=0

""" file finder
  set path=.,,**
  set complete-=i
  set wildmenu
  set wildmode=longest:full,full
  set wildignore+=**/node_modules/**                " javascript modules
  set wildignore+=**/env/**                         " python environment
  set wildignore+=.hg,.git,.svn                     " version control
  set wildignore+=*.aux,*.out,*.toc                 " LaTeX intermediate files
  set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
  set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
  set wildignore+=*.sw?                             " vim swap files

""" commands
  let mapleader = " "
  let maplocalleader = " "

  """ common
    nnoremap  '     `
    nnoremap  *     *N
    nnoremap  j     gj
    nnoremap  k     gk
    nnoremap  gj    j
    nnoremap  gk    k
    nnoremap  B     ^
    nnoremap  E     $
    nnoremap  Y     y$
    nnoremap  c*    *Ncgn
    inoremap  kj    <esc>
    inoremap  jk    <esc>
    nnoremap  vb    <c-v>
    inoremap  <F1>  <esc>
    nnoremap  <F1>  <nop>
    nnoremap  <cr>  o<esc>

  """ heresy
    noremap  <c-s> :w<cr>
    noremap  <c-c> "+y
    noremap  <c-v> "+p
    inoremap <c-s> <esc>:w<cr>a
    inoremap <c-c> <esc>"+y
    inoremap <c-v> <esc>"+pa
    noremap! <c-a> <home>
    noremap! <c-e> <end>

  """ multi command repeatable mappings
    nmap <c-p>              <plug>PasteBelowLine
    nmap -                  <plug>MoveLineDown
    nmap _                  <plug>MoveLineUp
    nmap >w                 <plug>IndentWord
    nmap <w                 <plug>UnIndentWord

  """ special
    " mappings for navigating the autocomplete menu
    inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
    inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

    " fold everything except current line
    nnoremap <leader>z zMzvzz

    " clear last command
    nnoremap <leader>l :echo<cr>

    " panic button - ROT13 entire file
    nnoremap <space><space> mzggg?G`z

    nnoremap <silent> <leader>o :setlocal spell! spelllang=en_us<cr>
    nnoremap <silent> <leader>/ :noh<bar>call UnHighlightWords()<cr>

  """ window splits
    noremap <c-h>   <c-w>h
    noremap <c-j>   <c-w>j
    noremap <c-k>   <c-w>k
    noremap <c-l>   <c-w>l
    noremap <c-m-h> <c-w>H
    noremap <c-m-j> <c-w>J
    noremap <c-m-k> <c-w>K
    noremap <c-m-l> <c-w>L

  """ file specific
    nnoremap <silent> <leader>ev   :vsp    $MYVIMRC<cr>
    nnoremap <silent> <leader>sv m":source $MYVIMRC<cr>

  """ training
    nnoremap ``     :echo "use ''"<cr>
    nnoremap $      <esc>:echo "use E"<cr>
    nnoremap ^      <esc>:echo "use B"<cr>
    inoremap <esc>  <esc>:echo "use jk"<cr>a

  """ text objects
    """ folds
      onoremap iz :<c-u>normal! [z0jV]zk<cr>
      onoremap az :<c-u>normal! [zV]z<cr>
      vnoremap iz :<c-u>normal! [z0jV]zk<cr>
      vnoremap az :<c-u>normal! [zV]z<cr>
      onoremap if :<c-u>normal! [z0jV]zk<cr>
      onoremap af :<c-u>normal! [zV]z<cr>
      vnoremap if :<c-u>normal! [z0jV]zk<cr>
      vnoremap af :<c-u>normal! [zV]z<cr>

""" auto commands
  augroup vimrc
    autocmd!

    " when opening a file position the cursor to where it last was
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
      \   execute 'normal! g`"' |
      \ endif

    " plugins just have to mess with these...
    autocmd FileType *      set fo-=c fo-=r fo-=o fo+=1 fo+=t
    autocmd FileType *      set textwidth=0
    autocmd FileType c,cpp  setlocal foldmethod=marker foldmarker={,}
    autocmd FileType c,cpp  setlocal ts=8 sts=8 sw=8
    " autocmd FileType py     nnoremap <buffer> <localleader>r command

    " modeline folding executes after BufReadPost...
    autocmd BufEnter    * execute 'normal! zvzz'
    autocmd SourcePost  * execute 'normal! zvzz'

    " remove trailing spaces upon saving
    autocmd BufWritePre * %s/\s\+$//e

    " reload .Xresources, should probably do it with 'entr' though
    autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
  augroup END

""" backups
  set backup
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

""" abbreviations
  iabbrev todo TODO

""" LSP settings
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
  syntax region par1 matchgroup=luaCode start="^lua << EOF$" end="^EOF$"
  highlight luaCode ctermfg=14

""" TODO
  " Language Server Protocol, Linter, autocomplete etc.
  " add a bunch of abbreviations (filetype specific)
  " lua highlighting in vimrc
  " undo tree visualizer
  " managing swap file to open diff in two windows
  " normalize diff highlighting
  " add a bunch of training commands
  " edit status line

""" folding
  set foldenable
  set foldlevelstart=0
  set foldnestmax=10
  set modelineexpr

  """ foldexpr function
    let g:running_level = 1
    function Fde(lnum)
      let line = getline(a:lnum)
      let level = indent(a:lnum)/&shiftwidth+1
      if line =~ '\v^\s*\"{3}.*$'
        let g:running_level = level
        return '>'.level
      elseif line !~ '[^\s]'
        return '='
      elseif level == 1
        let g:running_level = 1
        return 1
      elseif level <= g:running_level
        let g:running_level = level-1
        return level-1
      else
        return '='
      endif
    endfunction

  """ foldtext function
    function Fdt()
      let line   = getline(v:foldstart)
      let suffix = (v:foldend-v:foldstart).' lines'
      let width  = winwidth(0) - &fdc - &number * &numberwidth
      let count  = width - len(line) - len(suffix)
      let spaces = repeat(' ', count)
      return line.spaces.suffix
    endfunction

" vim: fdm=expr fdl=0 fde=Fde(v\:lnum) fdt=Fdt()
