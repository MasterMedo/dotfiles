" vim: ts=2 sw=2 sts=2 fdm=expr fde=VimrcFoldExpr()
""" TODO
  " language server protocol - documentation, references
  " train: `[, ^r=, c_^f, c_^r^w, c_^r0, c_^r^l, ^e, ^y, z=
  " macro to the end of the file mapping -> 1000@k or qj@k@jq@j
  " wrong fold colour for lower level folds neovim/neovim #12982
  " auto-command - turn off syntax and sync plugins for buffers with long lines

""" vimrc
  let mapleader       = " "
  let maplocalleader  = " "

  " highlight embedded lua and python code
  let g:vimsyn_embed  = 'lP'

""" plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

  """ visuals
    Plug 'mastermedo/vim-tinge'
    Plug 'romainl/vim-cool'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'psliwka/vim-smoothie'
    Plug 'subnut/vim-smoothie'
    """ RRethy/vim-illuminate
      Plug 'RRethy/vim-illuminate'
      let g:Illuminate_ftHighlightGroups = {
        \ '*:blacklist': ['Comment', 'String']
        \ }
      let g:Illuminate_highlightUnderCursor = 0
      autocmd VimEnter * highlight IlluminatedWord gui=italic,bold

    """  chrisbra/colorizer
      Plug 'chrisbra/colorizer'
      let g:colorizer_debug = 0
      let g:colorizer_colornames_disable = 1
      let g:colorizer_vimhighlight_disable = 1
      nnoremap <leader>C :ColorToggle<cr>

    """ vim-airline/vim-airline 160.445ms start-up
      Plug 'vim-airline/vim-airline'
      " let g:airline#extensions#disable_rtp_load = 1 " 13.6ms save start-up
      " let g:airline_extensions = [] " 11.38ms save start-up
      " let g:airline_highlighting_cache = 1 " 11ms save start-up
      " let g:airline_theme='dark_minimal' " 40ms worse start-up
      " let g:XkbSwitchLib = "/usr/lib/libxkbswitch.so"
      " let g:airline#extensions#xkblayout#enabled = 1

    """ junegunn/limelight.vim
      Plug 'junegunn/limelight.vim'
      let g:limelight_conceal_ctermfg = 240

    """ junegunn/goyo.vim
      Plug 'junegunn/goyo.vim'
      autocmd! User GoyoEnter Limelight
      autocmd! User GoyoLeave Limelight!
      nnoremap <silent> <F11> :Goyo<bar>set linebreak<cr>

    """ Yggdroot/indentline 54.325ms start-up and issue 298
      Plug 'Yggdroot/indentline'
      let g:indentLine_char_list = ['|', '¦', '┆', '┊']
      let g:indentLine_setColors = 0
      let g:indentLine_setConceal = 0
      let g:indentLine_fileTypeExclude = ['help']

  """ commands
    Plug 'AndrewRadev/bufferize.vim'
    """ tpope/vim-scriptease
      Plug 'tpope/vim-scriptease'
      nmap <silent> <leader>H zS

    """ tpope/vim-repeat
      Plug 'tpope/vim-repeat'
      nnoremap <silent> <plug>PasteBelowLine o<esc>"+gp:call repeat#set("\<plug>PasteBelowLine", v:count)<cr>
      nnoremap <silent> <plug>MoveLineDown ddp:call repeat#set("\<plug>MoveLineDown", v:count)<cr>
      nnoremap <silent> <plug>MoveLineUp ddkP:call repeat#set("\<plug>MoveLineUp", v:count)<cr>
      nnoremap <silent> <plug>IndentWord viWo<esc>i<tab><esc>llB:call repeat#set("\<plug>IndentWord", v:count)<cr>
      nnoremap <silent> <plug>UnIndentWord viWo<esc>i<bs><esc>llB:call repeat#set("\<plug>UnIndentWord", v:count)<cr>

    """ mhinz/vim-sayonara
      Plug 'mhinz/vim-sayonara'
      let g:sayonara_confirm_quit = 0

  """ interfaces
    Plug 'chrisbra/recover.vim' " 36.988ms start-up
    Plug 'stefandtw/quickfix-reflector.vim'
    """ junegunn/fzf
      Plug 'junegunn/fzf.vim'
      Plug 'junegunn/fzf', {'do': './install --bin' }
      nnoremap <silent> <leader>B :Buffers<cr>
      nnoremap <silent> <leader>F :Files<cr>

    Plug 'jremmen/vim-ripgrep'
    """ iamcco/markdown-preview.nvim
      Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },
                                            \'for': ['markdown', 'vim-plug'] }
      nnoremap <leader>P :MarkdownPreview<cr>

    """ mbbill/undotree
      Plug 'mbbill/undotree'
      let g:undotree_DiffAutoOpen = 0
      let g:undotree_RelativeTimestamp = 0
      let g:undotree_SetFocusWhenToggle = 1
      nnoremap <leader>U :UndotreeToggle<cr>

    """ preservim/nerdtree 55.537ms start-up
      Plug 'preservim/nerdtree'
      Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
      " let NERDTreeMinimalUI=1
      " let NERDTreeShowHidden=1
      nnoremap <leader>N :NERDTreeToggleVCS<cr>

  """ text objects
    " Plug 'wellle/targets.vim'           issue 246
    Plug 'chaoren/vim-wordmotion'
    Plug 'tpope/vim-surround'
    """ tpope/vim-speeddating
      Plug 'tpope/vim-speeddating'
      autocmd VimEnter * SpeedDatingFormat %d.%m.%Y
    Plug 'tpope/vim-commentary'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-entire'

  """ miscellaneous
    Plug 'xolox/vim-misc'

  """ file type specific
    Plug 'fatih/vim-go'
    Plug 'dag/vim-fish'
    Plug 'vim-scripts/lua.vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    """ tpope/vim-markdown
      Plug 'tpope/vim-markdown'
      let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

    """ glacambre/firenvim
      Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
      if exists('g:started_by_firenvim')
        set laststatus=0
        let w:airline_disable_statusline = 1
      endif

  """ auto-complete and language server protocol
    """ neoclide/coc.nvim
      Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['json', 'python']}
      let g:coc_global_extensions = [
        \ 'coc-python',
        \ 'coc-json',
        \ 'coc-snippets',
        \ 'coc-tabnine']

      " ~/.config/nvim/coc-settings.json
      "{
      "  "suggest.keepCompleteopt": true,
      "  "python.linting.enabled": false,
      "  "python.analysis.diagnosticEnabled": false
      "}

      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)
      inoremap <expr> <tab> pumvisible() ? "\<c-y>" :
               \ <sid>check_back_space() ? "\<tab>" :
               \ exists('*coc#refresh') ? coc#refresh() : "\<tab>"

      function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

    """ dense-analysis/ale
      Plug 'dense-analysis/ale'
      let g:ale_python_flake8_options = '--ignore=E121,E126,E226,E24,E501'
      let b:ale_linters = {'python': ['flake8']}
      " 🐛❌💀💢💣📉☠
      let g:ale_sign_error = '❌'
      " 💡🔎🔔⚡⚠
      let g:ale_sign_warning = '⚠'
      let g:ale_sign_info = 'i'
      " 👎💩📉📍🔎🔔🔖🔜➡️ ⁉️
      let g:ale_sign_style_error = '👎'
      " 👉💄📍🔎🔖🔜➡️ ‼️
      let g:ale_sign_style_warning = '👉'
      autocmd VimEnter * highlight link alewarningsign  warningmsg
      autocmd VimEnter * highlight link alestylewarning warningmsg

  """ plugins to check out
    " nvim-treesitter/nvim-treesitter
    " Konfekt/FastFold
    " romgrk/winteract.vim
    " justinmk/vim-sneak
    " alok/notational-fzf-vim
    " reedes/vim-pencil
    " chrisbra/matchit
    " tpope/vim-fugitive
    " tpope/vim-unimpaired
    " tpope/vim-abolish
    " Chiel92/vim-autoformat
    " Xuyuanp/nerdtree-git-plugin
    " airblade/vim-gutter
    " jreybert/vimagit
    " svermeulen/vim-yoink


call plug#end()
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :PlugUpdate<cr>

""" settings
  """ file
    scriptencoding utf-8
    set encoding=utf-8
    set nobomb
    filetype plugin on
    set autoread

  """ basics
    set autochdir
    set lazyredraw
    set scrolloff=9
    set sidescrolloff=5
    set number
    set relativenumber
    set ignorecase
    set smartcase
    set noerrorbells
    set visualbell
    set belloff=all
    set helpheight=15
    set hidden
    set splitbelow
    set splitright
    set noshowmode
    set shortmess+=I
    set updatetime=3000
    set report=0
    set gdefault
    set inccommand=split
    set nostartofline
    set diffopt+=algorithm:patience,indent-heuristic
    set shada='500,<10000,s1000,:1000 " marks, lines, KB, commands

  """ colours
    syntax on
    set cursorline
    set synmaxcol=1000
    set background=dark
    set termguicolors
    colorscheme vim-tinge
    set conceallevel=2
    set concealcursor=inc
    call matchadd('ColorColumn', '\%81c') " set colorcolumn=+1

  """ backups
    set backup
    " setlocal nobackup
    " setlocal nowritebackup
    set backupext=.bak
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

  """ folding
    set foldenable
    set foldopen-=hor
    set foldopen-=search
    set foldlevelstart=0
    set foldnestmax=10
    set foldtext=PersonalFoldText()
    set modelineexpr

  """ spelling
    set spell
    set spelllang=en_gb
    " set dictionary=/usr/share/dict/british
    set spellfile=$HOME/.config/nvim/spell/en.utf-8.add

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
    set suffixes+=.log,.aux,.bst,.out,.toc,.blg,.bbl
    set suffixesadd+=.py,.tex,.c,.js

  """ auto-complete
    set completeopt=menuone,noinsert
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
    set breakat-=-

  """ special characters
    set list
    set showbreak=↪\  " this comment preserves a trailing whitespace
    set listchars=tab:‹-›,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
    set fillchars=vert:\ ,fold:\ ,eob:x
    if has('nvim-0.5')
      set fillchars+=foldopen:▾,foldsep:│,foldclose:▸
    endif

""" functions
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

  """ foldexpr function
    let g:running_level = 1                           " last line fold level
    function! VimrcFoldExpr()                         " fold expr function
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
    " doesn't handle fold column and sign column great, pull requests welcome
    function! PersonalFoldText()                                " foldtext func
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

  """ diff current buffer with saved file
    " TODO: do diffoff when buffer gets closed?
    function! s:DiffWithSaved()
      setlocal nospell
      let filetype=&ft
      diffthis
      vnew | r # | normal! 1Gdd
      diffthis
      exe "setlocal bt=nofile bh=wipe nobl noswf ro nospell ft=" . filetype
    endfunction

""" commands
  command! DiffSaved call s:DiffWithSaved()

""" mappings
  """ ctrl
    inoremap <c-@> <c-space>
    inoremap <c-f> <c-x><c-f>
    inoremap <c-s> <cmd>w<cr>
    inoremap <c-u> <c-g>u<c-u>
    inoremap <c-w> <c-g>u<c-w>
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

  """ auto-complete
    inoremap <expr> <c-j> pumvisible() ? "\<down>" : "\<c-j>"
    inoremap <expr> <c-k> pumvisible() ? "\<up>"   : "\<c-k>"
    inoremap <expr> <esc> pumvisible() ? "\<c-e>"  : "\<esc>"

  """ common
    nnoremap  '       `
    nnoremap  *       *N
    nnoremap  Y       y$
    nmap      K       <c-u>
    nmap      J       <c-d>
    nnoremap  c*      *Ncgn
    nnoremap  vb      <c-v>
    nnoremap  Q       <nop>
    nnoremap  <cr>    <nop>
    nnoremap  <F1>    <nop>
    nnoremap  <space> <nop>
    nnoremap  č       ;
    nnoremap  Č       :
    nnoremap  ć       '
    nnoremap  Ć       "
    nnoremap  q:     :q

  """ leader
    nnoremap  <leader>a za
    nnoremap  <leader>c zc
    nnoremap  <leader>d :echo strftime('%c')<cr>
    nnoremap  <leader>i :echom 'battery: '.system('bat')[:-2].'%'<cr>
    nnoremap  <leader>l :echo<cr>
    nnoremap  <leader>n :cnext<cr>
    nnoremap  <leader>o zo
    nnoremap  <leader>p :cprev<cr>
    nnoremap  <leader>q :q<cr>
    vnoremap  <leader>s :!sort<cr>
    nnoremap  <leader>w :w<cr>
    nnoremap  <leader>z zxzz

    nnoremap  <leader><leader>      mzggg?G`z
    nnoremap  <silent>  <leader>/   :noh<bar>call UnHighlightWords()<cr>
    nnoremap  <silent>  <leader>gb  :setlocal spell spelllang=en_gb
          \ spellfile=$HOME/.config/nvim/spell/en.utf-8.add<cr>
    nnoremap  <silent>  <leader>hr  :setlocal spell spelllang=hr
          \ spellfile=$HOME/.config/nvim/spell/hr.utf-8.add<cr>
    nnoremap  <silent>  <leader>ev  :vsp      $MYVIMRC<cr>
    nnoremap  <silent>  <leader>es  :exec 'vsp' &g:spellfile<cr>
    nnoremap  <silent>  <leader>sv  m":source $MYVIMRC<cr>

  """ training
    nnoremap ``     <cmd>echo "use ''"<cr>
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

  """ relative motions
    nnoremap  <expr> j v:count == 0 ? 'gj' : 'j'
    nnoremap  <expr> k v:count == 0 ? 'gk' : 'k'
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

""" auto-commands
augroup vimrc
  autocmd!
  """ auto-complete
    autocmd CompleteDone <buffer> if has_key(v:completed_item, 'word') && v:completed_item.word =~ '\.$'
                              \| call feedkeys("\<bs>")
                              \| endif

    autocmd CompleteDone <buffer> if has_key(v:completed_item, 'word') && v:completed_item.word =~ '($'
                              \| call feedkeys(")\<Left>", 'in')
                              \| endif

  """ window cursor line
    autocmd WinEnter    * setlocal cursorline
    autocmd WinLeave    * setlocal nocursorline
    autocmd InsertEnter * setlocal nocursorline
    autocmd InsertEnter * setlocal cursorline

  """ :h restore-cursor 54.494ms start-up
    autocmd VimEnter * exe "normal! zxzz"
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  """ file type specific
    autocmd FileType  * setlocal  formatoptions=tqjl1
    autocmd FileType  * setlocal  textwidth=0
    autocmd FileType  python nnoremap <f5> :!python %<cr>
    " autocmd SourcePost  * set filetype+=
    " autocmd BufNewFile,BufRead * if &filetype == ''
    "       \| setlocal filetype=noft
    "       \| endif

  """ trailing spaces and blanks
    " remove trailing spaces at the end of the line
    autocmd BufWritePre * %s/\s\+$//e

    " remove trailing blanks at the end of the file
    autocmd BufWritePre * %s/\($\n\s*\)\+\%$//e

  """ commands that should be done by 'entr'
    autocmd BufWritePost .Xresources,.Xdefaults silent exec "!xrdb %"
    autocmd BufWritePost *.tex silent exec "!pdflatex %:p"
    execute 'autocmd BufWritePost ' . &g:spellfile . " silent exec 'mkspell! %'"

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

  """ RGB colours
    highlight highlightedword1 guifg=#000000 guibg=#ffaf00
    highlight highlightedword2 guifg=#000000 guibg=#afff00
    highlight highlightedword3 guifg=#000000 guibg=#00ffff
    highlight highlightedword4 guifg=#000000 guibg=#d70000
    highlight highlightedword5 guifg=#000000 guibg=#ff5faf
    highlight highlightedword6 guifg=#000000 guibg=#d7ffff

""" abbreviations
  inoreabbrev #i    #include
  inoreabbrev #d    #define
  inoreabbrev todo  TODO
  inoreabbrev cap   \chapter{}<left><cmd>call getchar(0)<cr>
  inoreabbrev sec   \section{}<left><cmd>call getchar(0)<cr>
  inoreabbrev ssec  \subsection{}<left><cmd>call getchar(0)<cr>
  inoreabbrev fn    \footnote{}<left><cmd>call getchar(0)<cr>

  cnoreabbrev         W   noa w
  cnoreabbrev <expr>  q   v:char =~ "!" ? "q" : "Sayonara"
  cnoreabbrev <expr>  wq  v:char =~ "!" ? "wq" : "w<bar>Sayonara"
  cnoreabbrev         w!! exec 'sil w !sudo tee % > /dev/null' <bar> edit!
