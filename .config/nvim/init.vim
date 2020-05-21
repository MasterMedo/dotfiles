""" TODO
  " lsp - documentation
  " `[, ^r=, c_^f, c_^r^w, c_^r0, c_^r^l, ^e, ^y
  " macro to the end of the file mapping -> 1000@k or qj@k@jq@j
  " look into pasting - noautoindent on all terminals

""" vimrc
  let mapleader       = " "
  let maplocalleader  = " "

  " highlight embedded lua and python code
  let g:vimsyn_embed  = 'lP'

""" plugins
call plug#begin('~/.vim/plugged')

  """ visuals
    """ mastermedo/vim-tinge
      Plug 'mastermedo/vim-tinge'

    """ chrisbra/colorizer
      Plug 'chrisbra/colorizer'
      let g:colorizer_debug = 0
      let g:colorizer_colornames_disable = 1
      let g:colorizer_vimhighlight_disable = 1
      nnoremap <leader>C :ColorToggle<cr>

    """ ryanoasis/vim-devicons
      Plug 'ryanoasis/vim-devicons'

    """ vim-airline/vim-airline
      Plug 'vim-airline/vim-airline'
      " let g:XkbSwitchLib = "/usr/lib/libxkbswitch.so"
      " let g:airline#extensions#xkblayout#enabled = 1

    """ junegunn/goyo.vim
      Plug 'junegunn/goyo.vim'
      autocmd! User GoyoEnter Limelight
      autocmd! User GoyoLeave Limelight!
      nnoremap <silent> <F11> :Goyo<bar>set linebreak<cr>

    """ Yggdroot/indentline               issue 298
      Plug 'Yggdroot/indentline'
      let g:indentLine_char_list = ['|', '¦', '┆', '┊']
      let g:indentLine_setColors = 0
      let g:indentLine_setConceal = 0
      let g:indentLine_fileTypeExclude = ['help']

    """ junegunn/limelight.vim
      Plug 'junegunn/limelight.vim'
      let g:limelight_conceal_ctermfg = 240

  """ commands
    """ nixon/vim-vmath
      Plug 'nixon/vim-vmath'
      nnoremap         ++  vip++
      vnoremap <expr>  ++  VMATH_YankAndAnalyse()

    """ tpope/vim-repeat
      Plug 'tpope/vim-repeat'
      nnoremap <silent> <plug>PasteBelowLine  o<esc>"+gp:call repeat#set("\<plug>PasteBelowLine", v:count)<cr>
      nnoremap <silent> <plug>MoveLineDown    ddp:call repeat#set("\<plug>MoveLineDown",   v:count)<cr>
      nnoremap <silent> <plug>MoveLineUp      ddkP:call repeat#set("\<plug>MoveLineUp",     v:count)<cr>
      nnoremap <silent> <plug>IndentWord      viWo<esc>i<tab><esc>llB:call repeat#set("\<plug>IndentWord",     v:count)<cr>
      nnoremap <silent> <plug>UnIndentWord    viWo<esc>i<bs><esc>llB:call  repeat#set("\<plug>UnIndentWord",   v:count)<cr>

    """ mhinz/vim-sayonara
      Plug 'mhinz/vim-sayonara'
      let g:sayonara_confirm_quit = 0

  """ interfaces
    """ junegunn/fzf
      Plug 'junegunn/fzf.vim'
      Plug 'junegunn/fzf', {'do': './install --bin' }
      nnoremap <silent> <leader>B :Buffers<cr>
      nnoremap <silent> <leader>F :Files<cr>

    """ mbbill/undotree
      Plug 'mbbill/undotree'
      let g:undotree_DiffAutoOpen = 0
      let g:undotree_RelativeTimestamp = 0
      let g:undotree_SetFocusWhenToggle = 1
      nnoremap <leader>U :UndotreeToggle<cr>

    """ preservim/nerdtree
      Plug 'preservim/nerdtree'
      Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
      " let NERDTreeMinimalUI=1
      " let NERDTreeShowHidden=1
      nnoremap <leader>N :NERDTreeToggleVCS<cr>

    """ mhinz/vim-startify
      Plug 'mhinz/vim-startify'
      let g:startify_custom_header = ''

    """ chrisbra/recover.vim
      Plug 'chrisbra/recover.vim'

  """ text objects
    " Plug 'wellle/targets.vim'           issue 246
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-entire'

  """ miscellaneous
    Plug 'xolox/vim-misc'

  """ filetype specific
    Plug 'fatih/vim-go'
    Plug 'dag/vim-fish'
    Plug 'vim-scripts/lua.vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    """ dense-analysis/ale
      Plug 'dense-analysis/ale'
      let g:ale_python_flake8_options = '--ignore=E501'
      let b:ale_linters = {'python': ['flake8', 'pyls']}
      let g:ale_sign_error = '☠'
      let g:ale_sign_warning = '⚠'
      let g:ale_sign_info = 'i'
      let g:ale_sign_style_error = '☠s'
      let g:ale_sign_style_warning = '⚠s'
      let g:ale_completion_enabled = 1
      set omnifunc=ale#completion#OmniFunc

  """ plugins to check out
    """ lifepillar/vim-mucomplete
      " Plug 'lifepillar/vim-mucomplete' " remap tab, mapclear
      " let g:mucomplete#tab_when_no_results = 1
      " let g:mucomplete#enable_auto_at_startup = 0

    " Chiel92/vim-autoformat
    " Shougo/deoplete.nvim
    " Xuyuanp/nerdtree-git-plugin
    " Yggdroot/LeaderF
    " airblade/vim-gutter
    " chrisbra/matchit
    " jreybert/vimagit
    " terryma/vim-multiple-cursors
    " tpope/vim-fugitive
    " tpope/vim-unimpaired
    " vim-syntastic/syntastic


call plug#end()
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :PlugUpdate<cr>

""" settings
  """ basics
    set nobomb
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
    set helpheight=15
    set hidden
    set splitbelow
    set splitright

  """ colors
    syntax on
    set cursorline
    set synmaxcol=300
    set background=dark
    set termguicolors
    colorscheme vim-tinge
    set conceallevel=2
    set concealcursor=inc
    call matchadd('ColorColumn', '\%81c') " set colorcolumn=+1

  """ backups
    set backup
    set undofile
    set swapfile

    set undodir  =~/.vim/tmp/undo//
    set directory=~/.vim/tmp/swap//
    set backupdir=~/.vim/tmp/backup//

    if !isdirectory(expand(&undodir))
      call mkdir(expand(&undodir), "p")
    endif

    if !isdirectory(expand(&backupdir))
      call mkdir(expand(&backupdir), "p")
    endif

    if !isdirectory(expand(&directory))
      call mkdir(expand(&directory), "p")
    endif

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

  """ autocomplete
    set completeopt=menuone,longest
    set shortmess+=c

  """ tabs and wrapping
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
    set shiftround
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

""" mappings
  """ ctrl
    inoremap <c-@> <c-space>
    inoremap <c-f> <c-x><c-f>
    inoremap <c-s> <cmd>w<cr>
    inoremap <c-u> <c-g>u<c-u>
    inoremap <c-w> <c-g>u<c-w>
    inoremap <c-space> <c-x><c-o>
    nnoremap <c-s> :w<cr>
    nnoremap <c-t> :tabnew<cr>
    noremap! <c-a> <home>
    noremap! <c-e> <end>
    noremap! <c-v> <cmd>set paste<cr><c-r>+<cmd>set nopaste<cr>
    vnoremap <c-c> "+ygv"*y
    """ window splits
      " ^w + - < > :only
      noremap <c-h>   <c-w>h
      noremap <c-j>   <c-w>j
      noremap <c-k>   <c-w>k
      noremap <c-l>   <c-w>l
      noremap <c-a-h> <c-w>H
      noremap <c-a-j> <c-w>J
      noremap <c-a-k> <c-w>K
      noremap <c-a-l> <c-w>L

  """ autocomplete
    let select_first = "\<c-x>\<c-o>"
      \ ."\<C-R>=pumvisible()?\"\\<down>\":\"\"\<cr>"
      \ ."\<cmd>echo\<cr>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <expr> .     "." . select_first
    inoremap <expr> <c-j> pumvisible() ? "\<down>" : "\<c-j>"
    inoremap <expr> <c-k> pumvisible() ? "\<up>"   : "\<c-k>"
    inoremap <expr> <esc> pumvisible() ? "\<c-e>"  : "\<esc>"
    inoremap <expr> <tab> pumvisible() ? "\<c-y>"  :
             \ <sid>check_back_space() ? "\<tab>"  : select_first

    " inoremap <expr> <c-j> pumvisible() ? "\<c-n>"  : "\<c-j>"
    " inoremap <expr> <c-k> pumvisible() ? "\<c-p>"  : "\<c-k>"

  """ common
    nnoremap  '       `
    nnoremap  *       *N
    nnoremap  Y       y$
    nnoremap  c*      *Ncgn
    nnoremap  vb      <c-v>
    nnoremap  Q       <nop>
    nnoremap  <cr>    o<esc>
    nnoremap  <F1>    <nop>
    nnoremap  <space> <nop>

  """ leader
    nnoremap  <leader>a za
    nnoremap  <leader>c zc
    nnoremap  <leader>o zo
    nnoremap  <leader>z zMzvzz
    nnoremap  <leader>n :cnext<cr>
    nnoremap  <leader>p :cprev<cr>
    nnoremap  <leader>w :w<cr>
    nnoremap  <leader>q :q<cr>
    nnoremap  <leader>l :echo<cr>
    nnoremap  <leader>d :echo strftime('%c')<cr>
    nnoremap  <leader>i :echom 'battery: '.system('bat')[:-2].'%'<cr>

    nnoremap  <leader><leader>      mzggg?G`z
    nnoremap  <silent>  <leader>/   :noh<bar>call UnHighlightWords()<cr>
    nnoremap  <silent>  <leader>sp  :setlocal spell! spelllang=en_us<cr>
    nnoremap  <silent>  <leader>ev  :vsp      $MYVIMRC<cr>
    nnoremap  <silent>  <leader>sv  m":source $MYVIMRC<cr>

  """ training
    nnoremap ``     <cmd>echo "use ''"<cr>
    nnoremap $      <cmd>echo "use E"<cr>
    nnoremap ^      <cmd>echo "use B"<cr>
    " inoremap <esc>  <cmd>echo "use jk"<cr>

  """ repeatable
    nmap <c-p>  <plug>PasteBelowLine
    nmap -      <plug>MoveLineDown
    nmap _      <plug>MoveLineUp
    nmap >w     <plug>IndentWord
    nmap <w     <plug>UnIndentWord

  """ visual mode
    vnoremap > >gv
    vnoremap < <gv

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

  """ relative motions
    nnoremap  <expr> j  v:count == 0 ? 'gj' : 'j'
    nnoremap  <expr> k  v:count == 0 ? 'gk' : 'k'
    nnoremap  K   5k
    nnoremap  J   5j
    nnoremap  gj  j
    nnoremap  gk  k
    nnoremap  B   g^
    nnoremap  E   g$
    nnoremap  g^  ^
    nnoremap  g$  $

  """ mappings to <esc>
    noremap!  kj    <esc>
    noremap!  jk    <esc>
    noremap!  KJ    <esc>
    noremap!  JK    <esc>
    inoremap  <F1>  <esc>

""" autocmds
augroup vimrc
  autocmd!
  autocmd VimEnter * if !argc() | Startify | NERDTreeVCS | wincmd w | endif
  """ autocomplete
    autocmd CompleteDone <buffer> if v:completed_item.word =~ '\.$'
                              \| call feedkeys("\<bs>")
                              \| endif

    autocmd CompleteDone <buffer> if v:completed_item.word =~ '($'
                              \| call feedkeys(")\<Left>", 'in')
                              \| endif

  """ window cursorline
    autocmd WinEnter    * setlocal cursorline
    autocmd WinLeave    * setlocal nocursorline
    autocmd InsertEnter * setlocal nocursorline
    autocmd InsertEnter * setlocal cursorline

  """ :h restore-cursor
    autocmd VimEnter    * exec 'normal! zvzz'
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
      \   execute 'normal! g`"zvzz' |
      \ endif

  """ filetype specific
    autocmd SourcePost  *       set filetype+=
    autocmd FileType    *       setlocal  fo-=c fo-=r fo-=o fo+=1 fo+=t
    autocmd FileType    *       setlocal  textwidth=0
    autocmd FileType    c,cpp   setlocal  foldmethod=marker foldmarker={,}
    autocmd FileType    c,cpp   setlocal  ts=8 sts=8 sw=8
    autocmd FileType    python  setlocal  ts=4 sts=4 sw=4

  """ trailing spaces and blanks
    " remove trailing spaces at the end of the line
    autocmd BufWritePre * %s/\s\+$//e

    " remove trailing blanks at the end of the file
    autocmd BufWritePre * %s/\($\n\s*\)\+\%$//e

  """ commands that should be done by 'entr'
    autocmd BufWritePost .Xresources,.Xdefaults silent exec '!xrdb %'
    " autocmd FileType tex autocmd BufWritePost <buffer> silent exec '!pdflatex %'
    autocmd BufWritePost <buffer> if &ft=~'tex'|silent exec '!pdflatex %'|endif
    autocmd BufWritePost $MYVIMRC silent source $MYVIMRC

augroup END

""" word highlighter
  """ function HighlightWord
    let g:word_id = 97531
    function! HighlightWord(n)
        normal! mz"zyiw
        silent! call matchdelete(g:word_id+a:n)
        let word_pattern = '\V\<'.escape(@z, '\').'\>'
        call matchadd("highlightedword".a:n, word_pattern, 1, g:word_id+a:n)
        normal! `z
    endfunction

  """ function UnHighlightWords
    function! UnHighlightWords()
      for i in range(1, 6)
        silent! call matchdelete(g:word_id+i)
      endfor
    endfunction

  """ mappings
    nnoremap <silent> <leader>1 :call HighlightWord(1)<cr>
    nnoremap <silent> <leader>2 :call HighlightWord(2)<cr>
    nnoremap <silent> <leader>3 :call HighlightWord(3)<cr>
    nnoremap <silent> <leader>4 :call HighlightWord(4)<cr>
    nnoremap <silent> <leader>5 :call HighlightWord(5)<cr>
    nnoremap <silent> <leader>6 :call HighlightWord(6)<cr>

  """ rgb colors
    highlight highlightedword1 guifg=#000000 guibg=#ffaf00
    highlight highlightedword2 guifg=#000000 guibg=#afff00
    highlight highlightedword3 guifg=#000000 guibg=#00ffff
    highlight highlightedword4 guifg=#000000 guibg=#d70000
    highlight highlightedword5 guifg=#000000 guibg=#ff5faf
    highlight highlightedword6 guifg=#000000 guibg=#d7ffff

  """ 256 colors
    highlight highlightedword1 ctermfg=16 ctermbg=214
    highlight highlightedword2 ctermfg=16 ctermbg=154
    highlight highlightedword3 ctermfg=16 ctermbg=51
    highlight highlightedword4 ctermfg=16 ctermbg=160
    highlight highlightedword5 ctermfg=16 ctermbg=205
    highlight highlightedword6 ctermfg=16 ctermbg=195

""" abbreviations
  inoreabbrev #i    #include
  inoreabbrev #d    #define
  inoreabbrev todo  TODO
  inoreabbrev cap   \chapter{}<left><cmd>call getchar(0)<cr>
  inoreabbrev sec   \section{}<left><cmd>call getchar(0)<cr>
  inoreabbrev ssec  \subsection{}<left><cmd>call getchar(0)<cr>
  inoreabbrev fn    \footnote{}<left><cmd>call getchar(0)<cr>
  inoreabbrev wop   with open('') as f:<cmd>call getchar(0)<cr>

  cnoreabbrev         w!! w !sudo tee > /dev/null %
  cnoreabbrev         W   noa w
  cnoreabbrev <expr>  w   v:char =~ "!" ? "w" : "noa w"
  cnoreabbrev <expr>  q   v:char =~ "!" ? "q" : "Sayonara"
  cnoreabbrev <expr>  wq  v:char =~ "!" ? "wq" : "noa w<bar>Sayonara"

""" folding
  set foldenable
  set foldopen-=hor
  set foldopen-=search
  set foldlevelstart=0
  set foldnestmax=10
  set foldtext=Fdt()
  set modelineexpr

  """ buffer width function
    function! BufWidth()
      let width = winwidth(0)
      let numberwidth = max([&numberwidth, strlen(line('$')) + 1])
      let numwidth = (&number || &relativenumber) ? numberwidth : 0
      let foldwidth = &foldcolumn

      if &signcolumn == 'yes'
        let signwidth = 2
      elseif &signcolumn == 'auto'
        let signs = execute(printf('sign place buffer=%d', bufnr('')))
        let signs = split(signs, '\n')
        let signwidth = len(signs) > 1 ? 2 : 0
      else
        let signwidth = 0
      endif
      return width - numwidth - foldwidth - signwidth
    endfunction

  """ foldexpr by paragraph
    function Fde_paragraph()
      return getline(v:lnum-1)=~'^\s*$'&&getline(v:lnum)=~'\S'?'>1':1
    endfunction

  """ foldexpr function
    let g:running_level = 1                           " last line fold level
    function Fde()                                    " fold expr function
      let line      = getline(v:lnum)                 " current  line text
      let prev_line = getline(v:lnum-1)               " previous line text
      let level     = indent(v:lnum)/&shiftwidth+1    " expected fold level
      let char = trim(split(&commentstring, '%s')[0]) " comment char
      if line =~ '\v^\s*\'.char.'{3}.*$'              " is line a fold title?
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
      let marker = split(&foldmarker, ',')[0]                   " fold marker
      let line   = substitute(line, marker, '', 'g')            " remove marker
      let cchar  = trim(split(&commentstring, '%s')[0])         " comment char
      let line   = substitute(line, '\V'.cchar.' \*', '', 'g')  " remove cchar
      let suffix = (v:foldend - v:foldstart).' lines'
      let width  = BufWidth()
      let count  = width - strdisplaywidth(line) - len(suffix)  " spaces count
      let spaces = repeat(' ', count)                           " create filler
      return line.spaces.suffix
    endfunction

" vim: ts=2 sw=2 sts=2 fdm=expr fde=Fde()
