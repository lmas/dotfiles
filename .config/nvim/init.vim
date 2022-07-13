
"###################################################################################################
"PLUGINS

call plug#begin('~/.config/nvim/plugins')
Plug 'base16-project/base16-vim'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'fatih/vim-go'
Plug 'alvan/vim-closetag'
"Plug '1995eaton/vim-better-javascript-completion'
"Plug 'othree/html5.vim'
"Plug 'dag/vim-fish'
call plug#end()

"###################################################################################################
"PLUGIN SETTINGS

" base16
let g:bufferline_echo = 0
let g:airline_theme='base16'
set noshowmode
" set background=dark
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard

" nerdcommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" General completion and lsp
set completeopt=menuone,noinsert,noselect
set shortmess+=c " Disables anoying, extra messages from completion
lua require'lspconfig'.gopls.setup{}

" compe
let g:compe = {}
let g:compe.min_length = 3
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

" vim-go
let g:go_gopls_enabled = 0 " gopls is already being run by the lsp plugin, disable running yet another copy
let g:go_code_completion_enabled = 0
let g:go_echo_go_info = 0 " fix some weird message from completion
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1 " Prevents breaking undo history
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_highlight_operators = 1 " doesn't work??
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_build_constraints = 1

" vim-closetag
let g:closetag_filetypes = 'html,tmpl'
let g:closetag_emptyTags_caseSensitive = 0

" vim-better-javascript-completion
" let g:vimjs#casesensistive = 0

"###################################################################################################
" GENERAL SETTINGS

"These two are already set by plug#end
"syntax enable
"filetype plugin indent on

set relativenumber
set ruler
set colorcolumn=120
set showcmd
set nomodeline
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

" tabs
set nolist " don't show tabs/newlines
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set copyindent
autocmd Filetype go setlocal shiftwidth=8 softtabstop=8
autocmd Filetype yaml setlocal shiftwidth=2 softtabstop=2

" searching
set nohlsearch
set ignorecase " ignore case when searching
set smartcase  " ignore case if pattern is all lower, else case-sensitive
set incsearch  " show search matches as you type

" backups
set swapfile
set writebackup " protect against any crashes during writes
set hidden      " don't close buffers? keeps undo history when switching buffer

" No bells
set noerrorbells
set visualbell
set t_vb=

" Remove trailing white spaces on buffer writes for all file types
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
autocmd BufWritePre * call TrimWhiteSpace()

"###################################################################################################
" KEY MAPPINGS

let mapleader = " "
nnoremap ; :

" toggles indenting of text when pasting
set pastetoggle=<F2>

" Switch between buffers
nnoremap <Tab>     :bn<CR>
nnoremap <S-Tab>   :bp<CR>
nnoremap <leader>d :bw<CR>

" Copy whole buffer to clipboard
nnoremap <leader>y :w !xclip -i -sel clip<CR>
" And paste in clipboard to buffer
nnoremap <leader>p :r !xclip -o -sel clip<CR>

" Allow saving of files as sudo when one forget to start vim using sudo
nnoremap <leader>W :w !sudo tee > /dev/null %<CR>

" Spellchecking
nnoremap <leader>v :setlocal spell spelllang=en_gb<CR>
nnoremap <leader>b z=

" Show message list (from plugins for example)
nnoremap <leader>m :messages<CR>

" Various simple shortcuts
nnoremap <leader>s :%s/
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" Clears the LSP errors
nnoremap <silent><expr> <leader>t ClearLSP()

function! ClearLSP()
         lua vim.lsp.diagnostic.clear(0)
endfunction

" Tab completion
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
imap <expr>       <Tab>     TabComplete()
imap <expr>       <S-Tab>     TabCompletePrev()

function! TabComplete()
        if pumvisible()
                return "\<C-n>"
        elseif strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                return "\<Tab>"
        else
                call compe#complete()
                return "\<C-y>"
        end
endfunction

function! TabCompletePrev()
        if pumvisible()
                return "\<C-p>"
        else
                return "\<S-Tab>"
        end
endfunction
