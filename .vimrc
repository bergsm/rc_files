"TODO add persistent undo

"TODO implement
"osascript -e 'tell application "Terminal"' -e 'set size of front window to {836, 1050}' -e 'end tell' 2>/dev/null

syntax enable		" enable syntax processing


"TODO set font

set viminfo='20,<1000,s1000


" use tabs for makefiles
if has ("autocmd")
    filetype plugin indent on
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

set title

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd
"set cursorline
set showmatch
set background=dark
set nosmartindent
set autoindent

"let color = "DarkYellow"
let color = "LightBlue"

"TODO add in a variation for light background
" change vim colors comment these out for default colors
highlight comment  ctermfg=DarkGray
execute "highlight MatchParen  ctermfg=White ctermbg=".color
execute "highlight underlined  ctermfg=".color
highlight LineNr ctermfg=LightGray
execute "highlight constant ctermfg=".color
execute "highlight statement gui=bold ctermfg=".color
highlight preproc ctermfg=DarkGray
highlight Identifier ctermfg=DarkGray
highlight Pmenu ctermbg=DarkGray guibg=DarkGray
highlight PmenuSel ctermbg=Black guibg=Black
execute "highlight type gui=bold ctermfg=".color
highlight Special term=bold ctermfg=DarkGray
execute "highlight Todo term=bold ctermfg=White ctermbg=".color
highlight Visual term=bold ctermfg=NONE ctermbg=235


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

    au FileType * set fo-=c fo-=r fo-=o
endif

function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-P>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

function FileHeading()
    let s=line(".")
    call setline(s,"/***********************************************")
    call append(s,"* File name:")
    call append(s+1,"* Description:")
    call append(s+2,"* Author:")
    call append(s+3,"* Date:")
    call append(s+4,"************************************************/")
    unlet s
    return ""
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
    return ""
endfunction
inoremap /// <C-R>=FunctionHeading()<CR>

autocmd BufNewFile,BufRead *.handlebars set syntax=html


"inoremap <expr> <enter> getline('.') =~ '^\s*//' ? '<enter><esc>S' : '<enter>'
"nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
"nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'

"use j and k to naviage autocomplete
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
set completeopt=longest,menuone

inoremap kj <Esc>`^
vnoremap lkj <Esc>
"nnoremap <nowait> lkj :wq<CR>
nnoremap ;lk :wq<CR>
inoremap ;lk <Esc>`^:wq<CR>
nnoremap sdf :q!<CR>
inoremap sdf <Esc>`^:q!<CR>
vnoremap < <gv
vnoremap > >gv
noremap WW :w<CR>
"search and replace current word from here til end of file
nnoremap sr :.,$s/<c-r>=expand("<cword>")<cr>/replace/gc
"global search and replace
nnoremap sG :%s/foo/bar/gc
