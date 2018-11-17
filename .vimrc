syntax enable		" enable syntax processing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd
"set cursorline
set showmatch
set background=dark
set smartindent
set autoindent
if has ("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \ endif
endif

function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-P>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
set completeopt=longest,menuone

inoremap kj <Esc>`^
vnoremap kj <Esc>
nnoremap lkj :wq<CR>
inoremap lkj <Esc>`^:wq<CR>
nnoremap sdf :q!<CR>
inoremap sdf <Esc>`^:q!<CR>
vnoremap < <gv
vnoremap > >gv
