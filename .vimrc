
" PLUGINS ######################################################################
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage itself, required
Plugin 'https://github.com/VundleVim/Vundle.vim.git'
Plugin 'https://github.com/chriskempson/base16-vim.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/fatih/vim-go.git'
Plugin 'https://github.com/othree/html5.vim.git'
Plugin 'https://github.com/1995eaton/vim-better-javascript-completion.git'
Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'https://github.com/maksimr/vim-jsbeautify.git'
call vundle#end()            " required
filetype plugin indent on    " required

" Settings for vim-go
let g:go_fmt_command = "goimports" " To let vim automagically fix imports
let g:go_fmt_experimental = 1 " Experminetal setting, prevents breaking undo history
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
" highlights
let g:go_highlight_operators = 1 " doesn't work??
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_build_constraints = 1

" Settings for vim-better-javascript-completion
let g:vimjs#casesensistive = 0

" Settings for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_aggregate_errors = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 0
let g:syntastic_cursor_column = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_css_checkers = [""] " TODO
let g:syntastic_html_checkers = [""] " TODO
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": ["css", "html", "javascript"] }

" Settings for vim-jsbeautify
au BufWritePre *.{js} :call JsBeautify()
au BufWritePre *.{json} :call JsonBeautify()
au BufWritePre *.{css} :call CSSBeautify()
au BufWritePre *.{html} :call HtmlBeautify()

" SETTINGS #####################################################################

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

" Shows autocompletion menu (even for single suggestions) and hides anoying
" preview buffer
set completeopt=menuone

" tabs
set nolist " don't show tabs/newlines
set shiftwidth=8
set softtabstop=8
set expandtab
set autoindent
set copyindent

" searching
set ignorecase " ignore case when searching
set smartcase  " ignore case if pattern is all lower, else case-sensitive
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

" KEY MAPS #####################################################################

let mapleader = " "

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
