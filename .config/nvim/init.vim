""" TODO
  " edit status line
  " normalize diff highlighting
  " LSP, linter, autocomplete etc.
  " training commands - bad habits
  " abbreviations (filetype specific)
  " managing swap file to open diff in two windows
  " undo tree visualizer and moving along the tree (preview changes)

""" vimrc
  let mapleader       = " "
  let maplocalleader  = " "
  let g:vimsyn_embed  = 'lP' " highlight embedded lua and python code

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
      nnoremap <silent> <plug>PasteBelowLine  o<esc>"+p     :call repeat#set("\<plug>PasteBelowLine", v:count)<cr>
      nnoremap <silent> <plug>MoveLineDown    ddp           :call repeat#set("\<plug>MoveLineDown",   v:count)<cr>
      nnoremap <silent> <plug>MoveLineUp      ddkP          :call repeat#set("\<plug>MoveLineUp",     v:count)<cr>
      nnoremap <silent> <plug>IndentWord      F a<tab><esc>w:call repeat#set("\<plug>IndentWord",     v:count)<cr>
      nnoremap <silent> <plug>UnIndentWord    F a<bs><esc>w:call  repeat#set("\<plug>UnIndentWord",   v:count)<cr>

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
    Plug 'neovim/nvim-lsp'
    Plug 'jreybert/vimagit'
    Plug 'vim-scripts/lua.vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
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

""" settings
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
    set linebreak
    set breakindent

  """ special characters
    set list
    set showbreak=↪\
    set listchars=tab:‹-›,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
    set fillchars=vert:\ ,fold:\ ,foldopen:#,foldclose:#,eob:x

  """ file finder
    set path=.,,**
    set complete-=i
    set wildmenu
    set wildmode=longest:full,full
    set wildignore+=**/node_modules/**                " javascript modules
    set wildignore+=**/env/**                         " python environment
    set wildignore+=.hg,.git,.svn                     " version control
    set wildignore+=*.aux,*.out,*.toc                 " LaTeX
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
    set wildignore+=*.sw?                             " vim swap files

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

""" mappings
  """ ctrl
    " noremap  <c-v> "+p
    " inoremap <c-v> <esc>"+pa
    nnoremap <c-s> :w<cr>
    inoremap <c-s> <esc>:w<cr>a
    vnoremap <c-c> "+ygv"*y
    noremap! <c-a> <home>
    noremap! <c-e> <end>
    nnoremap <c-t> :tabnew<cr>
    inoremap <c-u> <c-g>u<c-u>
    inoremap <c-w> <c-g>u<c-w>

  """ common
    nnoremap  '           `
    nnoremap  *           *N
    nnoremap  j           gj
    nnoremap  k           gk
    nnoremap  gj          j
    nnoremap  gk          k
    nnoremap  B           ^
    nnoremap  E           $
    nnoremap  Y           y$
    nnoremap  c*          *Ncgn
    nnoremap  vb          <c-v>
    nnoremap  <cr>        o<esc>
    nnoremap  <F1>        <nop>
    nnoremap  <space>     <nop>

  """ leader
    nnoremap  <leader>w   :w<cr>
    nnoremap  <leader>q   :wq<cr>
    nnoremap  <leader>z   zMzvzz
    nnoremap  <leader>l   :echo<cr>
    nnoremap  <leader>d   :echo strftime('%c')<cr>

  """ special
    " mappings for navigating the autocomplete menu
    inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
    inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

    " panic button - ROT13 entire file
    nnoremap <leader><leader> mzggg?G`z

    nnoremap <silent> <leader>o :setlocal spell! spelllang=en_us<cr>
    nnoremap <silent> <leader>/ :noh<bar>call UnHighlightWords()<cr>

  """ training
    nnoremap ``     :echo "use ''"<cr>
    nnoremap $      :echo "use E"<cr>
    nnoremap ^      :echo "use B"<cr>
    inoremap <esc>  <esc>:echo "use jk"<cr>a

  """ repeatable
    nmap <c-p>              <plug>PasteBelowLine
    nmap -                  <plug>MoveLineDown
    nmap _                  <plug>MoveLineUp
    nmap >w                 <plug>IndentWord
    nmap <w                 <plug>UnIndentWord

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

  """ mappings to <esc>
    noremap!  kj    <esc>
    noremap!  jk    <esc>
    noremap!  KJ    <esc>
    noremap!  JK    <esc>
    inoremap  <F1>  <esc>

""" autocmds
  augroup vimrc
    autocmd!

    """ :h restore-cursor
      autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
        \   execute 'normal! g`"' |
        \ endif

    """ filetype specific
      autocmd FileType *      set       fo-=c fo-=r fo-=o fo+=1 fo+=t
      autocmd FileType *      set       textwidth=0
      autocmd FileType c,cpp  setlocal  foldmethod=marker foldmarker={,}
      autocmd FileType c,cpp  setlocal  ts=8 sts=8 sw=8

    autocmd BufEnter    * exec 'normal! zvzz'
    autocmd SourcePost  * exec 'normal! zvzz'
    autocmd BufWritePre * %s/\s\+$//e           " trailing spaces

    " doesn't work well with SourcePost autocmd
    " autocmd BufWritePost $MYVIMRC silent source $MYVIMRC

    " should probably do it with 'entr' though
    autocmd BufWritePost .Xresources,.Xdefaults silent exec '!xrdb %'
  augroup END

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

""" LSP settings

lua << EOF
  require'nvim_lsp'.pyls.setup{}
  local nvim_lsp = require('nvim_lsp')
  local buf_set_keymap = vim.api.nvim_buf_set_keymap

  local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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

""" abbreviations
  iabbrev todo TODO
  cabbrev w!!  w !sudo tee > /dev/null %

""" folding
  set foldenable
  set foldopen-=hor
  set foldlevelstart=0
  set foldnestmax=10
  set modelineexpr

  """ foldexpr function
    let g:running_level = 1                           " last line fold level
    function Fde(lnum)                                " fold expr function
      let line      = getline(a:lnum)                 " current  line text
      let prev_line = getline(a:lnum-1)               " previous line text
      let level     = indent(a:lnum)/&shiftwidth+1    " expected fold level
      if line =~ '\v^\s*\"{3}.*$'                     " is line a fold title?
        let g:running_level = level
        return '>'.level                              " create a fold
      elseif line !~ '[^\s]' && prev_line !~ '[^\s]'  " are lines empty?
        return -1                                     " return undefined
      elseif line !~ '[^\s]'                          " is current line empty?
        return '='                                    " use last fold level
      elseif level == 1                               " has no indentation?
        let g:running_level = 1                       " belongs to fold level 1
        return 1
      elseif level <= g:running_level                 " belongs to lower level?
        let g:running_level = level-1                 " reduce the level
        return level-1
      else                                            " in all other cases
        return '='                                    " keep folding
      endif
    endfunction

  """ foldtext function
    function Fdt()                                              " foldtext func
      let line   = getline(v:foldstart)                         " get line text
      let suffix = (v:foldend - v:foldstart).' lines'
      let width  = winwidth(0) - &fdc - &number * &numberwidth  " editor width
      let count  = width - len(line) - len(suffix)              " spaces count
      let spaces = repeat(' ', count)                           " create filler
      return line.spaces.suffix
    endfunction

" vim: fdm=expr fdl=0 fde=Fde(v\:lnum) fdt=Fdt()
