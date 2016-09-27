autocmd ColorScheme * highlight LineNr ctermfg=darkyellow
colorscheme hybrid
syntax on

set background=dark
set hlsearch
set laststatus=2
set ruler
set title
set wildmenu
set number
set autoindent
set expandtab
set list
set listchars=tab:>\ ,trail:-,extends:>
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set tabstop=2
set whichwrap=b,s,h,l,<,>,[,]
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s/\t/  /ge

"---------------------------------------------------------------------------
" history
if !isdirectory(expand("~/.vim/backupdir/"))
    silent !echo "Creating backup dir..."
    silent !mkdir -p ~/.vim/backupdir
endif
if !isdirectory(expand("~/.vim/swap/"))
    silent !echo "Creating swap dir..."
    silent !mkdir -p ~/.vim/swap
endif
if !isdirectory(expand("~/.vim/undo/"))
    silent !echo "Creating undo dir..."
    silent !mkdir -p ~/.vim/undo
endif
set backupdir^=~/.vim/backup/
set undodir^=~/.vim/undo/

" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

" Shift+hjklで移動量を大きく
noremap H 3h
noremap J 3j
noremap K 3k
noremap L 3l

" F5キーでコンパイル
command! C call s:C()
nmap <F5> :C<CR>
function! s:C()
    :w
    :!g++ --std=c++11 -O2 -Wall % -o x
:endfunction
""""""""""""""""""""""""""""""
" md as markdown, instead of modula2
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" json as javascript
autocmd BufNewFile,BufRead *.{json} set filetype=javascript
" javascript as jquery
autocmd BufNewFile,BufRead *.{js} set filetype=jquery

""""""""""""""""""""""""""""""
" http://inari.hatenablog.com/entry/2014/05/05/231307
" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

""""""""""""""""""""""""""""""
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
" 挿入モード時、ステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction
""""""""""""""""""""""""""""""

