" Neovim Paths
let nvimdir = "/home/louis/.config/nvim"


" Dein
let bundles =
\ [ "Valloric/YouCompleteMe"
\ , "ltlollo/diokai"
\ , "raichoo/purescript-vim"
\ , "FrigoEU/psc-ide-vim"
\ , "snoe/nvim-parinfer.js"
\ , "tpope/vim-fugitive"
\ , "vim-pandoc/vim-pandoc-syntax"
\ , "vim-pandoc/vim-pandoc"
\ ]

let bundlepath = nvimdir . "/bundle"
execute "set runtimepath+=". bundlepath . "/repos/github.com/Shougo/dein.vim"

if dein#load_state(bundlepath)
  call dein#begin(bundlepath)

  call dein#add(bundlepath . "repos/github.com/Shougo/dein.vim")
  for bundle in bundles
    call dein#add(bundle)
  endfor

  call dein#end()
  call dein#save_state()
endif


" Appearance
color diokai

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

"" Vertical ruler
set ruler

"" Indentation
set expandtab
set tabstop=2
set shiftwidth=2
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
nnoremap <leader>d :call dein#install()<CR>
nnoremap ; :

