filetype off
filetype plugin indent off

"------------------------------
" dein
"------------------------------

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
execute 'set runtimepath^=' . s:dein_repo_dir
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml = s:dein_dir . '/plugins/dein.toml'
  let s:lazy_toml = s:dein_dir . '/plugins/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"------------------------------
" Color scheme
"------------------------------
" write color scheme before 'vim-indent-guides'
" http://www.camelstudio.jp/note/vim/186/
syntax on
" using ~/.Xresources-hybrid
" https://github.com/obiyuta/dotfiles/.Xresources-hybrid
let g:hybrid_use_Xresources = 1
colorscheme hybrid

" overwrite comment color
autocmd VimEnter,Colorscheme * :hi Comment ctermfg=237

"------------------------------
" vim-indent-guides 
"------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=233

"------------------------------
" Options 
"------------------------------
syntax on
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set number
set noswapfile
set ruler
set title
set showcmd
set clipboard=unnamed,autoselect
set background=dark
highlight LineNr ctermfg=darkyellow

"------------------------------
" Backspace
" http://sseze.hatenablog.com/entry/20120414/1334398422
"------------------------------
set nocompatible
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"------------------------------
" カーソル位置の復元
" http://qiita.com/jnchito/items/5141b3b01bced9f7f48f
"------------------------------
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

"------------------------------
" Status line
" http://blog.ruedap.com/2011/07/12/vim-statusline-git-branch-name
"------------------------------
set statusline=%<     " 行が長すぎるときに切り詰める位置
set statusline+=[%n]  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y    " バッファ内のファイルのタイプ
set statusline+=\     " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \   " 空白スペース2個
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\ \   " 空白スペース2個


"------------------------------
" Key Mapping 
" http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
"------------------------------
inoremap <silent> jj <ESC>

" window/tab/moveの操作感はなるべくtmuxと揃える
noremap : ;
noremap ; :

" Split window
nnoremap s <Nop>
nnoremap s\ :<C-u>vs<CR>
nnoremap s- :<C-u>sp<CR>
" Move between windows
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap so <C-w>w
" Swap window
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sO <C-w>r
" Resize window
call submode#enter_with('window-resize', 'n', '', 's>', '<C-w>>')
call submode#enter_with('window-resize', 'n', '', 's<', '<C-w><')
call submode#enter_with('window-resize', 'n', '', 's+', '<C-w>+')
call submode#enter_with('window-resize', 'n', '', 's_', '<C-w>-')
call submode#map('window-resize', 'n', '', '>', '<C-w>>')
call submode#map('window-resize', 'n', '', '<', '<C-w><')
call submode#map('window-resize', 'n', '', '+', '<C-w>+')
call submode#map('window-resize', 'n', '', '_', '<C-w>-')

filetype plugin indent on     " required!
filetype indent on
