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

" highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


if has ("autocmd")
    " Go to last position when opening file
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \ endif

    " don't highlight whitespace during editing
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
endif

function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-P>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"TODO
function FileHeading()
    let s:line=line(".")
    call setline(s:line,"//")
    call append(s:line,"// %")
    call append(s:line,"// Description - ")
    call append(s:line+1,"// Author - Shawn Berg")
    call append(s:line+2,"// Date - ".strftime("%b %d %Y"))
    call setline(s:line+3,"//")
    call setline(s:line+4,"")
    unlet s:line
    return "\<CR>"
endfunction
inoremap //// <C-R>=FileHeading()<CR>

function! FunctionHeading()
    let s=line(".")
    call setline(s,"/***********************************************")
    call append(s,"* Function name:")
    call append(s+1,"* Description:")
    call append(s+2,"* Parameters:")
    call append(s+3,"* Returns:")
    call append(s+4,"************************************************/")
    unlet s
    return "\<CR>"
endfunction
inoremap /// <C-R>=FunctionHeading()<CR>


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
