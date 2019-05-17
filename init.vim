if &compatible
  set nocompatible
endif

"" Local Machine settings
runtime local.vim

" Neovim Paths
if !exists(nvimdir)
    let nvimdir = "~/.config/nvim"
endif

" Dein
let bundles =
\ [ "Shougo/deoplete.nvim"
\ , "Valloric/YouCompleteMe"
\ , "ltlollo/diokai"
\ , "altercation/vim-colors-solarized"
\ , 'tikhomirov/vim-glsl'
\ , "tpope/vim-fugitive"
\ , "vim-airline/vim-airline"
\ , "vim-airline/vim-airline-themes"
\ , "vim-pandoc/vim-pandoc-syntax"
\ , "vim-pandoc/vim-pandoc"
\ ]

let bundlepath = nvimdir . "/dein"
execute "set runtimepath+=". bundlepath . "/repos/github.com/Shougo/dein.vim"

if dein#load_state(bundlepath)
  call dein#begin(bundlepath)

  call dein#add(bundlepath . "repos/github.com/Shougo/dein.vim")

  for bundle in bundles
    call dein#add(bundle)
  endfor

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif


" Appearance
" set background=light
color diokai
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

"" Syntax highlighting
syntax enable
filetype on
filetype plugin indent on

"" Show line and column number
set ruler

"" Indentation
set expandtab
set tabstop=4
set shiftwidth=4
set cindent

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


" Plugins
"" YouCompleteMe
nnoremap <leader>f :YcmCompleter FixIt<CR>
"" Dein
nnoremap <leader>d :call dein#install()<CR>
