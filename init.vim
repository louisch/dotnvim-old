"" Local Machine settings
runtime local.vim

" Neovim Paths
if !exists(nvimdir)
    let nvimdir = "~/.config/nvim"
endif

" Specify a directory for plugins
" - For vim: '~/.vim/plugged'
" - For Neovim: '~/.local/share/nvim/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'ltlollo/diokai'
Plug 'altercation/vim-colors-solarized'

Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'othree/csscomplete.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
call plug#end()

" Appearance
" set background=light
if has#colorscheme('diokai')
  color diokai
elseif has#colorscheme('desert')
  color desert
endif
" color solarized
if $TERM == "linux"
  set guicursor=
endif

"" Airline
let g:airline_theme = 'solarized'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'


"" Line numbers
set number
set relativenumber

"" Highlight tabs, EOLs, trailing whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/


" Behaviour

" Filetype recognition
filetype on
filetype plugin indent on

"" Syntax highlighting
syntax enable

"" Show line and column number
set ruler

"" Highlight current line
set cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

"" Omnicompletion
set omnifunc=syntaxcomplete#Complete

"" Indentation
set expandtab
set tabstop=4
set shiftwidth=4

" Call the function after opening a buffer
autocmd BufReadPost * call has#TabsOrSpaces()

"" Windows
set splitright
set splitbelow

"" Search
set ignorecase
set smartcase

"" Folds
set nofoldenable

"" Keybindings
let mapleader = ","
nnoremap <leader>vs :execute 'source' nvimdir . '/init.vim'<CR>
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>c :close<CR>
nnoremap ; :

"" Prompt to create directory if it does't exist
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

"" Source these files when saving them
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd BufWritePost $HOME/.dotfiles/* call system('fresh')

"" Filetype
autocmd FileType
      \ vim,html,css,scss,javascript,typescript,vue,json
      \ setlocal shiftwidth=2 tabstop=2
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS

"" Minimum amount of lines syntax will look backwards to
autocmd BufEnter * :syntax sync minlines=200

"" incremental search/replace
set incsearch
set inccommand=nosplit
augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CursorMoved * :set nohlsearch
    autocmd CmdlineLeave /,\? :set hlsearch
augroup END


" Plugins

"" YouCompleteMe
nnoremap <leader>f :YcmCompleter FixIt<CR>

"" UltiSnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

"" NERDTree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>nv :NERDTreeVCS<CR>

"" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gm :Gmove<CR>
nnoremap <leader>gg :Ggrep<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>

"" vim-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
