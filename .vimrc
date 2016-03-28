
set nocompatible               " be iMproved
filetype off
filetype plugin indent off

"==============================
" NeoBundle settings
"==============================
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle自身をNeoBundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
" 統合UI
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" VimShell
NeoBundle 'Shougo/vimshell'
" Snippets
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" 非同期処理
NeoBundle 'Shougo/vimproc'
" Git便利
NeoBundle 'tpope/vim-fugitive'
" Git gutter
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'VimClojure'
NeoBundle 'jpalardy/vim-slime'
" 構文チェック
NeoBundle 'scrooloose/syntastic'
" ファイルツリーを表示
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jistr/vim-nerdtree-tabs'
" Emmet
NeoBundle 'mattn/emmet-vim'
" インデントを可視化
NeoBundle 'nathanaelkane/vim-indent-guides'
" コメントのon/off（Ctrl+-）
NeoBundle 'tomtom/tcomment_vim'
" ログへのカラー情報反映
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 閉じ括弧自動補完
NeoBundle 'kana/vim-smartinput'
" Dash（https://kapeli.com/dash）
NeoBundle 'rizzatti/dash.vim'
" カラースキーム
NeoBundle 'w0ng/vim-hybrid'
" ユーザー定義submodule
NeoBundle 'kana/vim-submode'

call neobundle#end()
NeoBundleCheck

"------------------------------
" Unite.vim
"------------------------------
let g:unite_enable_start_insert=1

"------------------------------
" neosnippet
"------------------------------
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"------------------------------
" nerdtree 
"------------------------------
" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
nnoremap <silent><C-n> :NERDTreeToggle<CR>

"------------------------------
" vim-fugitive
"------------------------------
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

"------------------------------
" emmet-vim
"------------------------------
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '    '
    \ }

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

filetype plugin indent on     " required!
filetype indent on

"==============================
" Options 
"==============================
syntax on
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set number
set noswapfile
set ruler
set title
set showcmd
set clipboard=unnamed,autoselect
set background=dark
highlight LineNr ctermfg=darkyellow

"==============================
" カーソル位置の復元
" http://qiita.com/jnchito/items/5141b3b01bced9f7f48f
"==============================
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

"==============================
" Status line
" http://blog.ruedap.com/2011/07/12/vim-statusline-git-branch-name
"==============================
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


"==============================
" Key Mapping 
" http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
"==============================
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




