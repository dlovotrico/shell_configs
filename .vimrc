""
""--------------------------------------------------------------------[VIM CONFIGURATION FILE]
"
" DESCRIPTION
" Personal Vim configuration file. This file is intendeed to work with Vundle
" and the following plugins:
"
" - Airline 
"   https://github.com/vim-airline/vim-airline
"  
" - nerdtree
"   https://github.com/scrooloose/nerdtree
"
" - fugitive (Git integration, use with lightline)
"   https://github.com/tpope/vim-fugitive
"
"
"
" ADDITIONALS (non-plugin)
" - Powerline fonts
"   https://github.com/powerline/fonts
"
""----------------------------------




" ##--------------------------------------------------------------------[BASIC CONFIG]
syntax on
colorscheme anderson
set hlsearch     
set tabstop=4     
set expandtab   
set shiftwidth=4 
set autoindent   
set shiftround  
set number
set encoding=utf-8


set nocompatible              " force iMproved mode
filetype off                  " required


" Font
" set guifont=Source\ Code\ Pro\ for\ Powerline:h15:cANSI 


" set a path to the colors directory just in case
" set rtp+=~/.vim/colors/




" ##--------------------------------------------------------------------[BUNDLE CONFIG]

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Enable this if you want vundle to install plugins elsewhere
"call vundle#begin('~/some/path/here')




" ##--------------------------------------------------------------------[PLUGINS]

" Plugin help 
" :h                - general help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


" PLUGINS
Plugin 'VundleVim/Vundle.vim'    " - let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'      " - tells lightline the current branch.
                                 " - allows passing commands to Git.
"Plugin 'vim-airline/vim-airline'
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'



" --------------------------[Plugin configs]

" ----> Lightline config
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
" Gets rid of the --INSERT-- def marker
set noshowmode
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

let g:airline_theme='bubblegum'    " other themes: base16, bubblegum, luna, 

" IMPORTANT set the console's font to a Powerline font in your console's preferences. 
" Otherwise the triangular borders will not display correctly. 
 
" Change airline positions
function! AirlineInit()
  let g:airline_section_b = airline#section#create(['branch'])
  let g:airline_section_x = airline#section#create(['hunks'])
  let g:airline_section_y = '%y'
  let g:airline_powerline_fonts = 1
  let g:Powerline_symbols = 'fancy'
  let g:airline_left_sep = '»'
  let g:airline_left_sep = ''
  let g:airline_right_sep = '«'
  let g:airline_right_sep = ''
endfunction
autocmd User AirlineAfterInit call AirlineInit()
" end Airline config
"

" ----> Nerdtree config
" Open Nerdtree with Ctrl + n
map <C-n> :NERDTreeToggle<CR>
" Open Nerdtree automatically when opening a file
" autocmd vimenter * NERDTree
" Open Nertree automatically when opening a directory.
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" end Nerdtree config




" ##--------------------------------------------------------------------[VUNDLE END]
" 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on




" ##--------------------------------------------------------------------[ADDITIONALS]
" Put additional (non-Plugin code) after this line
