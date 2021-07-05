" vim: ts=2 sw=2 sts=2 fdm=expr fde=VimrcFoldExpr()
""" TODO
  " train: `[, i_^r=, c_^f, c_^r^w, c_^r0, c_^r^l, ^e, ^y, z=, gf
  " useful commands: zz, i_ctrl+j, ctrl_o, ctrl_i
  " macro to the end of the file mapping -> 1000@k or qj@k@jq@j
  " fold colour conflict with cursorline when going up?
  " auto-command - turn off syntax and sync plugins for buffers with long lines
  " when saving a file if there are trailing spaces the cursor jumps there instead of staying where it is
  " create a call matchdelete mapping for colorcolumn, (find a way to create a window based id)
  " get coc#float#scroll working

""" vimrc
  let mapleader       = " "
  let maplocalleader  = " "

  " highlight embedded lua and python code
  let g:vimsyn_embed  = 'lP'

  " enable python plugins in vim
  let g:python3_host_prog = '/usr/bin/python3'
  let g:python_host_prog = '/usr/bin/python2'
  set runtimepath +=~/.vim

""" plugins
  """ autoload
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin('~/.vim/plugged')

  """ visuals
    Plug 'romainl/vim-cool' " stop highlighting when not searching
    Plug 'mastermedo/vim-tinge' " my colour scheme
    Plug 'tomasiser/vim-code-dark' " vs code colour scheme
    Plug 'vim-airline/vim-airline' " alternative status line
    Plug 'morhetz/gruvbox' " gruvbox colour scheme
    Plug 'cormacrelf/vim-colors-github' " github colour scheme sort-of

    """  mastermedo/anonymizer.vim
      Plug 'mastermedo/anonymizer.vim' " anonymize buffer
      " characters for anonymizing:  ﱢ
      " nnoremap  <leader><leader>      :call AnonymizeBuffer()<cr>

    """ airblade/vim-gitgutter
      Plug 'airblade/vim-gitgutter' " adds git diff signs in the sign column
      let g:gitgutter_enabled = 1
      let g:gitgutter_map_keys = 0
      noremap <leader>ga :GitGutterStageHunk<cr>
      noremap <leader>gp :GitGutterPreviewHunk<cr>
      nnoremap ]g :GitGutterNextHunk<cr>
      nnoremap [g :GitGutterPrevHunk<cr>

    """ psliwka/vim-smoothie
      Plug 'psliwka/vim-smoothie' " smooth scrolling
      silent! map <unique> gg <Plug>(Smoothie_gg)
      silent! map <unique> G  <Plug>(Smoothie_G)

    """ RRethy/vim-illuminate
      Plug 'RRethy/vim-illuminate' " highlight current word matches in file
      let g:Illuminate_ftHighlightGroups = {
            \ '*:blacklist': ['Comment', 'String'] }
      let g:Illuminate_highlightUnderCursor = 0
      highlight default IlluminatedWord gui=italic,bold

    """  chrisbra/colorizer
      Plug 'chrisbra/colorizer' " colour hex colour strings
      let g:colorizer_debug = 0
      let g:colorizer_colornames_disable = 1
      let g:colorizer_vimhighlight_disable = 1
      nnoremap <leader>C :ColorToggle<cr>

    """ junegunn/goyo.vim
      Plug 'junegunn/goyo.vim' " remove HUD (distraction free mode)
      autocmd! User GoyoEnter Limelight
      autocmd! User GoyoLeave Limelight!
      nnoremap <silent> <F11> :Goyo<bar>set linebreak<cr>

    """ junegunn/limelight.vim
      Plug 'junegunn/limelight.vim' " decolour paragraphs not currently on
      let g:limelight_conceal_ctermfg = 240

    """ Yggdroot/indentline #298
      Plug 'Yggdroot/indentline' " represent indents with symbols
      let g:indentLine_char_list = ['∣', '¦', '┆', '┊']
      let g:indentLine_setColors = 0
      let g:indentLine_setConceal = 0
      let g:indentLine_fileTypeExclude = ['help', 'tex']

  """ commands
    Plug 'mattn/emmet-vim' " html generator
    Plug 'AndrewRadev/bufferize.vim' " store output of a command in a buffer
    Plug 'dstein64/vim-startuptime' " check start-up times with :StartupTime
    """ vim-scripts/loremipsum
      Plug 'vim-scripts/loremipsum' " 'generates' text
      nmap <leader>L :Loremipsum! 69<cr>

    """ arthurxavierx/vim-caser
      Plug 'arthurxavierx/vim-caser'
      map <leader>cp *gn<Plug>CaserVMixedCase
      map <leader>cc *gn<Plug>CaserVCamelCase
      map <leader>cs *gn<Plug>CaserVSnakeCase
      map <leader>cu *gn<Plug>CaserVUpperCase

    """ tpope/vim-scriptease
      Plug 'tpope/vim-scriptease' " get highlight groups for word under cursor
      nmap <silent> <leader>H zS

    """ tpope/vim-repeat
      Plug 'tpope/vim-repeat' " make commands repeatable
      nnoremap <silent> <plug>PasteBelowLine o<esc>"+gp:call
            \ repeat#set("\<plug>PasteBelowLine", v:count)<cr>
      nnoremap <silent> <plug>MoveLineDown ddp:call
            \ repeat#set("\<plug>MoveLineDown", v:count)<cr>
      nnoremap <silent> <plug>MoveLineUp ddkP:call
            \ repeat#set("\<plug>MoveLineUp", v:count)<cr>
      nnoremap <silent> <plug>IndentWord viWo<esc>i<tab><esc>llB:call
            \ repeat#set("\<plug>IndentWord", v:count)<cr>
      nnoremap <silent> <plug>UnIndentWord viWo<esc>i<bs><esc>llB:call
            \ repeat#set("\<plug>UnIndentWord", v:count)<cr>

    """ mhinz/vim-sayonara
      Plug 'mhinz/vim-sayonara' " use one command for :bdelete, :close, :quit
      let g:sayonara_confirm_quit = 0
      cnoreabbrev <expr>  q   v:char =~ "!" ? "q" : "Sayonara"
      cnoreabbrev <expr>  wq  v:char =~ "!" ? "wq" : "w<bar>Sayonara"

    """ inkarkat/SyntaxAttr.vim
      Plug 'inkarkat/SyntaxAttr.vim'
      nnoremap <leader>S :call SyntaxAttr#SyntaxAttr()<CR>

  """ interfaces
    Plug 'chrisbra/recover.vim' " adds a [d]iff option if swap file exists
    Plug 'stefandtw/quickfix-reflector.vim' " change multiple files at once
    Plug 'rhysd/git-messenger.vim' " read git messages on the line
    """ junegunn/fzf, jremmen/vim-ripgrep
      Plug 'junegunn/fzf.vim' " list files and buffers in a pop-up window
      Plug 'junegunn/fzf', {'do': './install --bin' }
      " Plug 'jremmen/vim-ripgrep' " drop contents of :Rg in a quick-fix window
      let g:fzf_layout = { 'window': {'width': 0.9, 'height': 0.8} }
      let g:fzf_action = {
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'
            \ }
      nnoremap <silent> <leader>F :Files<cr>
      nnoremap <silent> <leader>B :Buffers<cr>

    """ mbbill/undotree - has some severe bugs
      Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
      let g:undotree_DiffAutoOpen = 0
      let g:undotree_WindowLayout = 2
      let g:undotree_RelativeTimestamp = 0
      let g:undotree_SetFocusWhenToggle = 1
      nnoremap <leader>U :UndotreeToggle<cr>

    """ preservim/nerdtree and plugins (tiagofumo, Xuyuanp, ryanoasis)
      Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggleVCS' } |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' " icons for numerous file types

      " let NERDTreeMinimalUI = 1
      let g:NERDTreeShowHidden = 1
      let g:NERDTreeGitStatusUseNerdFonts = 1
      let g:NERDTreeExactMatchHighlightFullName = 1
      let g:NERDTreePatternMatchHighlightFullName = 1
      let g:NERDTreeFileExtensionHighlightFullName = 1
      nnoremap <leader>N :NERDTreeToggleVCS<cr>

  """ text objects
    " Plug 'wellle/targets.vim' " #246
    " Plug 'jiangmiao/auto-pairs' " automatically closes matching pair #305
    Plug 'kana/vim-textobj-user' " create your own textobj
    Plug 'kana/vim-textobj-line' " vil, val select a line
    Plug 'kana/vim-textobj-indent' " vai select indentation
    Plug 'kana/vim-textobj-entire' " vae, dae select entire buffer
    Plug 'tpope/vim-surround' " cs{[, ds', ysiw}, ysae[, ysil)
    Plug 'tpope/vim-commentary' " use gcc to (un)comment a line
    Plug 'nelstrom/vim-visual-star-search' " search and replace selected text
    """ tpope/vim-speeddating
      Plug 'tpope/vim-speeddating' " ctrl-a, ctrl-x works on dates
      augroup speeddating
        autocmd!
        autocmd VimEnter * SpeedDatingFormat %d.%m.%Y
      augroup END

    """ justinmk/vim-sneak
      Plug 'justinmk/vim-sneak' " s{char}{char} like f and t but with 2 chars
      map f <Plug>Sneak_f
      map F <Plug>Sneak_F
      map t <Plug>Sneak_t
      map T <Plug>Sneak_T
      let g:sneak#label = 1

    """ chaoren/vim-wordmotion
      Plug 'chaoren/vim-wordmotion' " makes ILoveVim three words #41
      nmap dw de
      nmap cw ce

  """ miscellaneous
    Plug 'xolox/vim-misc' " scripts for other plugins
    Plug 'airblade/vim-rooter' " chdir to project root
    let g:rooter_silent_chdir = 1

  """ file type specific
    Plug 'fatih/vim-go'
    let g:go_doc_keywordprg_enabled = 0

    Plug 'dag/vim-fish'
    Plug 'vim-scripts/lua.vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'memgraph/cypher.vim'
    """ tpope/vim-markdown
      Plug 'tpope/vim-markdown'
      let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

    """ iamcco/markdown-preview.nvim
      Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },
                                            \'for': ['markdown', 'vim-plug'] }
      nnoremap <leader>P :MarkdownPreview<cr>

    """ glacambre/firenvim - vim in the browser
      Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
      if exists('g:started_by_firenvim')
        set laststatus=0
        let w:airline_disable_statusline = 1
      endif

  """ auto-complete and language server protocol
    """ neoclide/coc.nvim
      Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['cs', 'tsx', 'ts', 'js', 'python', 'java'] }
      let g:coc_global_extensions = [
        \ 'coc-tsserver',
        \ 'coc-json',
        \ 'coc-snippets',
        \ 'coc-tabnine',
        \ 'coc-omnisharp',
        \ 'coc-python',
        \ 'coc-java']

      if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
        let g:coc_global_extensions += ['coc-prettier']
      endif

      if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
        let g:coc_global_extensions += ['coc-eslint']
      endif

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
      nmap <leader>grn <Plug>(coc-rename)
      inoremap <expr> <tab> pumvisible() ? "\<c-y>" :
               \ <sid>check_back_space() ? "\<tab>" :
               \ exists('*coc#refresh') ? coc#refresh() : "\<tab>"

      function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
      endfunction

      " inoremap <nowait><expr> <c-f> coc#float#scroll(1, 1) " doesn't work
      " inoremap <nowait><expr> <c-b> coc#float#scroll(0, 1) " doesn't work

    """ dense-analysis/ale
      Plug 'dense-analysis/ale' " asynchronous linter
      let g:ale_python_flake8_options = '--ignore=E121,E126,E226,E24,E501,W503'
      let b:ale_linters = {'python': ['flake8']}
      let g:ale_fixers = {'python': ['black']}
      " 🐛❌💀💢💣⛔🚫📉☠ ☢ ☣
      let g:ale_sign_error = '❌'
      " 💡🔎🔔⚡⚠
      let g:ale_sign_warning = '⚠'
      let g:ale_sign_info = 'i'
      " 👎💩📉📍🔎🔔🔖🔴🔜➡️ ⁉️
      let g:ale_sign_style_error = '👎'
      " 👉💄📍🔎🔖🔜➡️ ‼️
      let g:ale_sign_style_warning = '👉'
      highlight default link alewarningsign  warningmsg
      highlight default link alestylewarning warningmsg
      nnoremap ]e :ALENext<cr>
      nnoremap [e :ALEPrevious<cr>

  """ plugins to check out
    " nvim-treesitter/nvim-treesitter " better syntax highlighting
    " reedes/vim-pencil " auto-format prose as you're writing
    " tpope/vim-fugitive " git integration within vim
    " tpope/vim-unimpaired " useful for pairs of commands next, previous
    " tpope/vim-abolish " powerful replacements /building{,s}/facilit{y,ies}/
    " svermeulen/vim-yoink " holds history of yanks
    " liuchengxu/vista.vim " view and search lsp symbols and tags
    " norcalli/nvim-colorizer.lua " faster colourizer for neovim
    " junegunn/vim-emoji " Emoji for vim
    " jpalardy/vim-slime " send selected text to another terminal


call plug#end()
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :PlugUpdate<cr>

""" settings
  """ file
    filetype plugin indent on
    scriptencoding utf-8
    set encoding=utf-8
    set nobomb
    set autoread
    set helpheight=15

  """ flare
    set number
    set relativenumber
    set scrolloff=9
    set sidescrolloff=5
    set nostartofline
    set pumblend=20
    set winblend=15

  """ basics
    set lazyredraw

    set ignorecase
    set smartcase

    set noerrorbells
    set visualbell
    set belloff=all

    set hidden
    set splitbelow
    set splitright

    set noshowmode
    set updatetime=800
    set shortmess+=I
    set report=0

    set gdefault
    set inccommand=split

    set backspace=indent,eol,start
    set diffopt+=algorithm:patience,indent-heuristic
    set shada='500,<10000,s1000,:1000 " marks, lines, KB, commands

  """ colours
    syntax on
    colorscheme vim-tinge
    colorscheme codedark
    " let g:airline_theme = 'codedark'
    set termguicolors
    set cursorline
    set synmaxcol=1000
    set background=dark
    set conceallevel=2
    set concealcursor=inc
    call matchadd('ColorColumn', '\%81c') " set colorcolumn=+1
    highlight colorcolumn     guifg=#000000 guibg=#F3D409 gui=none
    highlight foldcolumn      guifg=#585858 guibg=none    gui=none
    highlight folded          guifg=#A8A8A8 guibg=#303030 gui=italic
    highlight conceal         guifg=#303030 guibg=none    gui=none
    highlight spellcap        guifg=#F3D409 guibg=none    gui=undercurl

  """ backups
    set backup
    set undofile
    set swapfile

    " setlocal nobackup
    " setlocal nowritebackup
    set backupext=.bak

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
    " set spell
    set spelllang=en_gb
    " set dictionary=/usr/share/dict/british
    " set thesaurus
    set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
    " syntax match String ".*" contains=@Spell
    " syntax match String '.*' contains=@Spell
    " syntax cluster String add=@NoSpell

  """ file finder
    set path=.,,**
    set complete-=i
    set wildmenu
    set wildmode=longest:full,full
    set wildignore+=**/node_modules/**                " javascript modules
    set wildignore+=**/__pycache__/**,*.pyc,**/env/** " python cache and env
    set wildignore+=.hg,.git,.svn                     " version control
    set wildignore+=*.aux,*.out,*.toc                 " LaTeX
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
    set wildignore+=*.sw?                             " vim swap files
    set wildignore+=*~,*.bak                          " back up files
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
    set autoindent
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
    " doesn't handle fold and sign column great, pull requests are welcome
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
    inoremap <c-p> <c-v>
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
    nnoremap  g;     g,
    nnoremap  g,     g;
    nnoremap <F2>    viw~

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
    nnoremap  <leader>ss :set spell<cr>
    nnoremap  <leader>ns :set nospell<cr>
    vnoremap  <leader>s :!sort<cr>
    nnoremap  <leader>w :w<cr>
    nnoremap  <leader>z zxzz

    nnoremap  <leader><leader>      mzggg?G`z
    nnoremap  <silent>  <leader>/   :noh<bar>call UnHighlightWords()<cr>
    nnoremap  <silent>  <leader>gb  :setlocal spell spelllang=en_gb
          \ spellfile=$HOME/.config/nvim/spell/en.utf-8.add<cr>
    nnoremap  <silent>  <leader>hr  :setlocal spell spelllang=hr
          \ spellfile=$HOME/.config/nvim/spell/hr.utf-8.add<cr>
    nnoremap  <silent>  <leader>us  :setlocal spell spelllang=en_us
          \ spellfile=$HOME/.config/nvim/spell/en.utf-8.add<cr>
    nnoremap  <silent>  <leader>ev  :vsp      $MYVIMRC<cr>
    nnoremap  <silent>  <leader>es  :exec 'vsp' &g:spellfile<cr>
    nnoremap  <silent>  <leader>sv  m":source $MYVIMRC<cr>

  """ training
    nnoremap ``     <cmd>echo "use ''"<cr>
    " inoremap <cr>   <cmd>echo "use ctrl-j"<cr>
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
  autocmd CursorHold <buffer> exec "checktime"
  autocmd VimEnter * highlight PmenuSel blend=0
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

  """ :h restore-cursor
    autocmd VimEnter * exe "normal! zxzz"
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  """ file type specific
    autocmd FileType * setlocal  formatoptions=tqjl1
    autocmd FileType * setlocal  textwidth=0
    autocmd FileType tex setlocal conceallevel=0
    autocmd FileType python nnoremap <f5> :!python %<cr>
    autocmd FileType cs nnoremap <f5> :!dotnet run<cr>
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
    nnoremap <silent> <leader>0 :call HighlightWord(0)<cr>
    nnoremap <silent> <leader>1 :call HighlightWord(1)<cr>
    nnoremap <silent> <leader>2 :call HighlightWord(2)<cr>
    nnoremap <silent> <leader>3 :call HighlightWord(3)<cr>
    nnoremap <silent> <leader>4 :call HighlightWord(4)<cr>
    nnoremap <silent> <leader>5 :call HighlightWord(5)<cr>
    nnoremap <silent> <leader>6 :call HighlightWord(6)<cr>

  """ RGB colours
    highlight link highlightedword0 normal
    highlight highlightedword1 guifg=#000000 guibg=#ffaf00
    highlight highlightedword2 guifg=#000000 guibg=#afff00
    highlight highlightedword3 guifg=#000000 guibg=#00ffff
    highlight highlightedword4 guifg=#000000 guibg=#d70000
    highlight highlightedword5 guifg=#000000 guibg=#ff5faf
    highlight highlightedword6 guifg=#000000 guibg=#d7ffff

""" abbreviations
  " inoreabbrev #i    #include
  " inoreabbrev #d    #define
  inoreabbrev todo  TODO
  " inoreabbrev cap   \chapter{}<left><cmd>call getchar(0)<cr>
  " inoreabbrev sec   \section{}<left><cmd>call getchar(0)<cr>
  " inoreabbrev ssec  \subsection{}<left><cmd>call getchar(0)<cr>
  " inoreabbrev fn    \footnote{}<left><cmd>call getchar(0)<cr>

  cnoreabbrev         W   noa w
  cnoreabbrev         w!! exec 'sil w !sudo tee % > /dev/null' <bar> edit!
