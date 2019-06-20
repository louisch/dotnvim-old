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
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'ltlollo/diokai'
Plug 'altercation/vim-colors-solarized'

Plug 'leafgarland/typescript-vim'
Plug 'othree/csscomplete.vim'
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
nnoremap <leader>v :execute 'source' nvimdir . '/init.vim'<CR>
nnoremap ; :

"" Filetype-specifc behaviours
autocmd FileType vim,html,css,scss,javascript,typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS


" Plugins

"" YouCompleteMe
nnoremap <leader>f :YcmCompleter FixIt<CR>

"" UltiSnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
