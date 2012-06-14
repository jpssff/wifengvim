set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"""""""""""vim本身配置""""""""""""

"内码使用utf8，优先以utf8尝试解码
set encoding=utf8
set fencs=utf8,cp936
"保存系统的语言
let LANGUAGE=expand('$LANG')
"设置语言，供vim使用
let $LANG="zh_CN.UTF-8"
"一般终端编码和系统编码保持一致
if LANGUAGE =~? 'zh_CN'
    set termencoding=cp936
else
    set termencoding=utf-8
endif

"通用的一些样式
sy on
colorscheme wf
"colorscheme wf2
set laststatus=2
set nobk
set statusline=%F\ [%{&fenc}\ %{&ff}\ L%l/%L\ C%c]\ %=%{strftime('%Y-%m-%d\ %H:%M')}
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
let g:html_indent_tags = 'head\|body'

"修正文件类型
autocmd BufNewFile,BufRead *.tpl,*.htm,tplt set filetype=html
autocmd BufNewFile,BufRead *.xaml set filetype=xml

"编辑文本文件时，tab不要变成空格
autocmd BufNewFile,BufRead *.txt,*.text,*.data set noexpandtab

"markdown语法文档
au BufRead,BufNewFile *.mkd,*.markdown,*.mdwn,*.text set filetype=mkd

"设置自动完成词典
autocmd Filetype javascript set dictionary+=$vim/vimfiles/directory/tangram
autocmd Filetype javascript,html,html set dictionary+=$vim/vimfiles/directory/javascript
autocmd Filetype php set dictionary+=$vim/vimfiles/directory/php

"每次编辑完.vimrc文件时立刻加载
"autocmd BufWritePost *vimrc :source $MYVIMRC

"<F12>快速编辑.vimrc
map <F12> :e $MYVIMRC<CR>

"进入当前文件的目录
map <leader>cd :cd %:h<CR>:pwd<CR>

"窗口切换
map <F5> <C-W>h
map <F6> <C-W>j
map <F7> <C-W>k
map <F8> <C-W>l
map <C-tab> <C-W>w

"窗口大小调整
map <M-F5> <C-W>+
map <M-F6> <C-W>-
map <M-F7> <C-W>>
map <M-F8> <C-W><

"系统粘贴板
map <leader>p "*p
map <leader>x "*x

"模拟less查看
map <leader>l :so $VIMRUNTIME/macros/less.vim<CR>

"""""""""" GUI设置 """"""""""""
if has('gui_running')
    let g:vimrc_font_height = 10.15
    function! s:ResizeFontSize(flag)
        if a:flag == 1
            let g:vimrc_font_height += 1
        elseif a:flag == 0
            let g:vimrc_font_height = 11.15
        elseif a:flag == -1
            let g:vimrc_font_height -= 1
        endif
        exec "set guifont=Consolas:h" . string(g:vimrc_font_height)
    endfunction
    call s:ResizeFontSize(0)

	"最大化
	au GUIEnter * simalt ~x
    
    "修改字体大小
    map <C-F5> :call <SID>ResizeFontSize(-1)<CR>
    map <C-F6> :call <SID>ResizeFontSize(0)<CR>
    map <C-F7> :call <SID>ResizeFontSize(0)<CR>
    map <C-F8> :call <SID>ResizeFontSize(1)<CR>
    
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


set viminfo='50,<1000,s100,:0,n~/.viminfo



""""""""""""""""""""插件配置"""""""""""""""""""""

"html缩进
let g:html_indent_strict = 1

"配置netrw插件更好的浏览目录
let g:netrw_altv      = 1
let g:netrw_winsize   = 23
let g:netrw_liststyle = 3

"NerdTree
map <F4> :NERDTreeToggle<CR>
imap <F4> <ESC>:NERDTreeToggle<CR>

"配置最近编辑文件列表个数
let MRU_Max_Menu_Entries = 100
let MRU_Window_Height = 15
map <F3> :call <SID>MruToggle()<CR>
function s:MruToggle()
    let winnum = bufwinnr('__MRU_Files__')
    if(winnum == -1)
        exec 'MRU'
    else
        exec winnum . 'wincmd q'
    endif
endfunction

"TList
"autocmd BufNewFile,BufRead *.py,*.c,*.h :TlistOpen
map <F2> :TlistToggle<CR>

"SingleCompile
"单文件编译插件
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr> 

"acp插件调用snipptMate定义的东东
let g:acp_behaviorSnipmateLength = 1
let g:acp_enableAtStartup = 0

"SVN插件映射
map <leader>sd <Plug>VCSDiff
map <leader>sv <Plug>VCSVimDiff
map <leader>si <Plug>VCSInfo
map <leader>su <Plug>VCSUpdate
map <leader>sc <Plug>VCSCommit

"crefvim插件映射
vmap <silent> <unique> ,, <Plug>CRV_CRefVimVisual
nmap <silent> <unique> ,, <Plug>CRV_CRefVimNormal
map <silent> <unique> ,w <Plug>CRV_CRefVimAsk
map <silent> <unique> ,c <Plug>CRV_CRefVimInvoke

"STL-Reference Manual for Vim
vmap <silent> <unique> .. <Plug>StlRefVimVisual
nmap <silent> <unique> .. <Plug>StlRefVimNormal
map <silent> <unique> .w <Plug>StlRefVimAsk
map <silent> <unique> .c <Plug>StlRefVimInvoke
map <silent> <unique> .e <Plug>StlRefVimExample

"Fuf插件
nnoremap <silent> sj     :FufBuffer<CR>
nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> sK     :FufFileWithFullCwd<CR>
nnoremap <silent> sf     :FufFile<CR>
nnoremap <silent> sl     :FufCoverageFileChange<CR>
nnoremap <silent> sL     :FufCoverageFileChange<CR>
nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sn     :FufMruFile<CR>
nnoremap <silent> sN     :FufMruFileInCwd<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> su     :FufBookmarkFile<CR>
nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> st     :FufTag<CR>
nnoremap <silent> sT     :FufTag!<CR>
nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> s,     :FufBufferTag<CR>
nnoremap <silent> s<     :FufBufferTag!<CR>
vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> s.     :FufBufferTagAll<CR>
nnoremap <silent> s>     :FufBufferTagAll!<CR>
vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> sg     :FufTaggedFile<CR>
nnoremap <silent> sG     :FufTaggedFile!<CR>
nnoremap <silent> so     :FufJumpList<CR>
nnoremap <silent> sp     :FufChangeList<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
nnoremap <silent> sy     :FufLine<CR>
nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> se     :FufEditDataFile<CR>
nnoremap <silent> sr     :FufRenewCache<CR>

"插件在不同平台下的配置
if has('win32') || has('win64')
    "日历插件
    let g:calendar_diary = "e:/calendar_diary"
    set wildignore+=.git\*,.hg\*,.svn\*,*.dll,*.exe
    let VimPluginBinDir = expand("$VIM/vimfiles/bin/")
	"ctags
	let Tlist_Ctags_Cmd='"'.VimPluginBinDir.'ctags.exe"'
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so
endif
