"TODO add persistent undo

syntax enable		" enable syntax processing

"set scrolloff=1000
set backup
set undofile
set undodir=~/.vim/undodir

set viminfo='20,<1000,s1000

set clipboard=unnamedplus

set backspace=indent,eol,start

set mouse=a

" use tabs for makefiles
if has ("autocmd")
    filetype plugin indent on
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    autocmd FileType mail set spell
    autocmd FileType markdown set spell
endif

"set title

set tabstop=4
set softtabstop=4
set shiftwidth=4

"set tabstop=3
"set softtabstop=3
"set shiftwidth=3

"set is hls
set is
set expandtab
set number
set showcmd
"set cursorline
"set cursorcolumn
set showmatch
set background=dark
set nosmartindent
set autoindent
set statusline+=%F
set statusline+=%10((%l,%c)%)
set statusline+=%P
set laststatus=2

"let color = "DarkYellow"
"let color = "LightBlue"
"let color = "LightBlue"
let color = "67"
"let compColor =
"let color = 166

"TODO add in a variation for light background
" change vim colors comment these out for default colors
highlight comment  ctermfg=238
execute "highlight MatchParen  ctermfg=White ctermbg=".color
execute "highlight underlined  ctermfg=".color
highlight LineNr ctermfg=247
execute "highlight constant ctermfg=".color
execute "highlight String term=bold ctermfg="245
execute "highlight statement ctermfg=".color
execute "highlight preproc ctermfg="240
"highlight Identifier ctermfg=247
execute "highlight Identifier ctermfg=".color
execute "highlight Structure ctermfg=".color
highlight Pmenu ctermbg=DarkGray guibg=DarkGray
highlight PmenuSel ctermbg=Black guibg=Black
execute "highlight type gui=bold ctermfg=".color
"execute "highlight Todo term=bold ctermfg=White ctermbg=".color
"highlight Special term=bold ctermfg=247
execute "highlight Special term=bold ctermfg=".color
highlight Visual term=bold ctermfg=NONE ctermbg=235
syn match Todo contained "\<\(TODO\|FIXME\|BUG\)"



"colorscheme jellybeans
colorscheme wal

execute "highlight Todo term=bold ctermfg=Black ctermbg=Yellow"
highlight diffAdded ctermfg=28
highlight diffRemoved ctermfg=196
highlight Todo ctermbg=187
hi CursorColumn ctermbg=NONE term=NONE cterm=NONE

" highlight whitespace
highlight ExtraWhitespace ctermbg=196 guibg=red
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


"Tab auto complete
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1) =~ '^\s*$'
    "if strpart( getline('.'), col('.')-2, 3) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-P>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"Comment block remaps
"function CommentBlock()
"    let s=line(".")
"    call setline(s,"#################################################")
"    call append(s,"#")
"    call append(s+1,"#################################################")
"    unlet s
"    return ""
"endfunction
"inoremap ### <C-R>=FileHeading()<CR>



"function FileHeading()
"    let s=line(".")
"    call setline(s,"/***********************************************")
"    call append(s,"* File name:")
"    call append(s+1,"* Description:")
"    call append(s+2,"* Author:")
"    call append(s+3,"* Date:")
"    call append(s+4,"************************************************/")
"    unlet s
"    return ""
"endfunction
"inoremap //// <C-R>=FileHeading()<CR>
"
"function! FunctionHeading()
"    let s=line(".")
"    call setline(s,"/***********************************************")
"    call append(s,"* Function name:")
"    call append(s+1,"* Description:")
"    call append(s+2,"* Parameters:")
"    call append(s+3,"* Returns:")
"    call append(s+4,"************************************************/")
"    unlet s
"    return ""
"endfunction
"inoremap /// <C-R>=FunctionHeading()<CR>

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

"use html syntax highlighting for handlebars files
autocmd BufNewFile,BufRead *.handlebars set syntax=html


"inoremap <expr> <enter> getline('.') =~ '^\s*//' ? '<enter><esc>S' : '<enter>'
"nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
"nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'

"use j and k to navigate autocomplete
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
set completeopt=longest,menuone

autocmd InsertEnter * set timeoutlen=90
autocmd InsertLeave * set timeoutlen=1000

"remaps
inoremap kj <Esc>`^
"inoremap <expr> kj pumvisible() ? "" : "<Esc>`^"
"nnoremap <nowait> lkj :wq<CR>
vnoremap f <Esc>`^
nnoremap ;lk :wq<CR>
nnoremap ;l :w<CR>
inoremap ;lk <Esc>`^:wq<CR>
inoremap ;l <Esc>`^:w<CR>
nnoremap sdf :q!<CR>
inoremap sdf <Esc>`^:q!<CR>
vnoremap < <gv
vnoremap > >gv
noremap WW :w<CR>
noremap ; :
vnoremap ; :
nnoremap yA ggyG``
vnoremap yA vggvGy``
nnoremap vA ggvG

noremap HEX :%!xxd<CR>
noremap BIN :%!xxd -r<CR>

command RUN !%:p

""inoremap ( ()<left>
""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>0
""inoremap {;<CR> {<CR>};<ESC>0
"search and replace current word from here til end of file
nnoremap sr :.,$s/<c-r>=expand("<cword>")<cr>/replace/gc
"global search and replace
nnoremap sG :%s/foo/bar/gc
