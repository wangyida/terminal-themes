set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" added nerdtree
Plugin 'scrooloose/nerdtree'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Markdown Vim Mode http://plasticboy.com/markdown-vim-mode/
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" vimtex
Plugin 'lervag/vimtex'

" A code-completion engine for Vim
Plugin 'Valloric/YouCompleteMe'

" Syntax checking
Plugin 'vim-syntastic/syntastic'

" Vim syntax for TOML
Plugin 'cespare/vim-toml'

" A dark theme for Vim: dracula
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/dracula-theme'
Plugin 'dracula/vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" """""""""""""""""""""""""""""""""""""""""
"
syntax on
syntax enable
set background=dark
set t_Co=256
set hlsearch
set number
set cursorline
set cursorcolumn
set colorcolumn=80

color dracula
" users simply had to include set termguicolors in their vimrc to get true 
" colors in the terminal– the one caveat being that it has to be a terminal 
" like iTerm2 that also supports “true colors”.
" gui colors if running iTerm
if $TERM_PROGRAM =~ "iTerm"
"  set termguicolors
endif

" neovim true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" vim airline
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'

let g:vimtex_view_method = 'zathura'

" Syntastic checks
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode = "passive"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" spell setting
"
hi SpellBad cterm=bold,italic 
" ctermfg=red
