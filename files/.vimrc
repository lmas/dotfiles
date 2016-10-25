
" PLUGINS ####################################################################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'fatih/vim-go'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'mattn/emmet-vim'
call vundle#end()            " required
filetype plugin indent on    " required

" Setup the vim-go plugin
let g:go_fmt_command = "goimports" " To let vim automagically fix imports
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Setup the emmet-vim plugin
let g:emmet_html5 = 1
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"autocmd FileType html,css imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" SETTINGS ####################################################################

let mapleader = " "
"set nowrap
set relativenumber
set ruler
set colorcolumn=80
set showcmd
set showmode
set modelines=0
set cursorline
set scrolloff=2
set ttyfast
set viminfo=
set encoding=utf-8
set title
set titlestring=%F\ -\ Vim
set showmatch
set matchpairs+=<:>
set mouse=a

" Hide annoying Preview buffer after autocompletion
set completeopt=menu

" tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set copyindent
" show tabs and trailing spaces
set list
set listchars=tab:>-,trail:-

"Hide whitespace chars in go files
au Filetype go setlocal nolist
au Filetype go setlocal softtabstop=8
au Filetype go setlocal shiftwidth=8

" searching
set ignorecase " ignore case when searching
set smartcase  " ignore case if pattern is all lower, else case-sensitive
"set nohlsearch   " highlight search terms
set incsearch  " show search matches as you type

" keep no backups
set nobackup
set noswapfile
set nohidden " make sure buffers gets closed whenever a file is closed

" No bells
set noerrorbells
set visualbell
set t_vb=

" colorscheme
syntax enable
set background=dark
let base16colorspace=256
colorscheme base16-default-dark

" KEY MAPS ####################################################################

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
"See help completion for source
function! CleverTab()
  if pumvisible()
    return "\<C-N>"
  endif
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-O>"
  else
    return "\<C-N>"
  endif
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>
"set complete+=k/usr/share/dict/american-english " Add english words

set pastetoggle=<F2> " toggles indenting of text when pasting
nnoremap ; :

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
nnoremap <F3> :call TrimWhiteSpace()<CR>

" Switch between buffers
nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>
nnoremap <leader>d :bw<CR>

" Copy whole buffer to clipboard
nnoremap <leader>y :w !xclip -i -sel clip<CR>
" And paste in clipboard to buffer
nnoremap <leader>p :r !xclip -o -sel clip<CR>

" Allow saving of files as sudo when one forget to start vim using sudo
nnoremap <leader>W :w !sudo tee > /dev/null %<CR>

" Various simple shortcuts
nnoremap <leader>s :%s/
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" Expand html stuff
imap <C-x> <plug>(emmet-expand-abbr)
