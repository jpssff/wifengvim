" 配置插件目录
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/becaning/vimdoccn'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/garbas/vim-snipmate'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/mileszs/ack.vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/vim-scripts/Align'
Plug 'https://github.com/xuhdev/SingleCompile'

" Initialize plugin system
call plug#end()

"""""""""""vim本身配置""""""""""""

"内码使用utf8，优先以utf8尝试解码
set encoding=utf8
set fencs=utf8,cp936
"保存系统的语言
let LANGUAGE=expand('$LANG')
let LC_CTYTPE = expand('$LC_CTYTPE')
"设置语言，供vim使用
let $LANG="zh_CN.UTF-8"
"一般终端编码和系统编码保持一致
if LANGUAGE =~? 'UTF' || LC_CTYTPE =~? 'UTF'
    set termencoding=utf-8
else
    set termencoding=cp936
endif

"通用的一些样式
sy on
"colorscheme wf2
set laststatus=2
set nobk
set statusline=%F\ [%{&fenc}\ %{&ff}\ L%l/%L\ C%c]\ %=%{strftime('%Y-%m-%d\ %H:%M')}
"设置viminfo
set viminfo='50,<1000,s100,:100,n~/.viminfo
"缩进使用的空白数
set shiftwidth=4
"文件中的tab代表的空格数
set tabstop=4
"插入tab时使用合适数量的空格
"set noexpandtab
set expandtab
"开启新行时使用智能自动缩进
set autoindent
set smartindent
set foldmethod=marker
set number
"set cursorline
"自动切换到编辑文件路径
"set autochdir

"下面这句是为了让较长的行显示
set display=lastline

"配置TOhtml生成的代码格式
let use_xhtml = 1
let html_use_css = 1
"是否需要强制显示行号
"let html_number_lines = 1

"修正文件类型
autocmd BufNewFile,BufRead *.tpl,*.htm,tplt set filetype=html
autocmd BufNewFile,BufRead *.xaml set filetype=xml

"编辑文本文件时，tab不要变成空格
autocmd BufNewFile,BufRead *.txt,*.text,*.data set noexpandtab

"markdown语法文档
au BufRead,BufNewFile *.mkd,*.markdown,*.mdwn,*.text set filetype=mkd


"<F12>快速编辑.vimrc
map <F12> :e $myvimrc<CR>

"进入当前文件的目录
map <leader>cd :cd %:h<CR>:pwd<CR>

"系统粘贴板
map <leader>p "*P
map <leader>x "*x
map <leader>cp gg"*yG<C-O><C-O>

"模拟less查看
map <leader>l :so $VIMRUNTIME/macros/less.vim<CR>

map <space> <C-F>

"""""""""" GUI设置 """"""""""""
if has('gui_running')
	"最大化
	"au GUIEnter * simalt ~x
    "只出现右边的滚动条即可
	set guioptions=cr
else
    "取消鼠标支持，这样终端可以复制文本
    set mouse=
endif


""""""""" Unix vim 配置 """""""""
if has('unix')


endif


""""""""" windows gvim设置 """"""""
if has('win32') || has('win64')
    "防止菜单发生乱码
    set langmenu=zh_CN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

	"临时文件目录
    set dir=c:/temp,c:/,.

    "c/c++头文件位置
    set path +=C:/MinGW/include,C:/MinGW/include/c++/3.4.5

    "c头文件tags文件
    set tags +=C:/MinGW/include/tags

    "设置make程序
    set makeprg=C:/MinGW/bin/mingw32-make

	"按<F11>调用系统默认程序打开文件
	nnoremap <silent> <F11> :let old_reg=@"<CR>:let @"=substitute(expand("%:p"), "/", "\\", "g")<CR>:silent!!cmd /cstart <C-R><C-R>"<CR><CR>:let @"=old_reg<CR>
	
endif

" 个人配置
