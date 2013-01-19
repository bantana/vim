""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim的基本设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set tags=~/go/tags

"设置viminfo选项
set viminfo='1000,f1,<1000

"设置取词程序
set keywordprg=sdcv

"设置折叠
"set foldmethod=indent
set foldmethod=syntax
"set foldmethod=marker
"set foldmethod=manual

"设置session的值
set sessionoptions="blank,buffers,sesdir,folds,help,options,tabpages,winsize,slash,unix"

"高亮行
"set cursorline

set autoindent "让vim编辑模式回车后保持上行的缩进
set guioptions-=T "windows下隐藏工具栏
set guioptions-=L "把gui左边的滑动条去掉
set guioptions-=r "把gui右边的滑动条去掉
set guioptions-=b " 隐藏下方的横向滚动条
"set guioptions+=b "显示下方的横向滚动条
autocmd GUIEnter  simalt ~x "windows下启动vim最大化
" 失去焦点时自动保存文件
au FocusLost * :wa
"set nowrap "设置不自动换行
set number "设置行号
set wrap 
set textwidth=120 
set formatoptions=qrn1 
set colorcolumn=121
"set background=dark "设置底色
:colorscheme molokai "设置主题

let $VIMFILES = $VIM.'/vimfiles' "定义变量 $VIMFILES
let $VIMDATA = $VIMFILES.'/vimdata' "定义变量 $VIMDATA
set backupdir=$VIMDATA/backup "设置备份文件路径
set directory=$VIMDATA/temp
set cindent "类似C语言程序的缩进
set autoindent "自动缩进，即为新行自动添加与当前行同等的缩进
set smartindent "基于autoindent的一些改进
set dictionary=~/.vim/codedict.cd

"搜索逐字符高亮，查询时非常方便
set hlsearch
set incsearch

syntax on "打开语法高亮
set shiftwidth=4 "自动缩进4个空格
set tabstop=4 "定义tab所等同的空格长度
set softtabstop=4 "表示让tab的宽度显示成和4个空格的宽度一样，shiftwidth和tabstop不一样的话，你会发现程序比较难看的。
set showmatch "高亮显示匹配的括号
set autoread "设置当文件从外部被改动时自动载入
set nocp "设置不兼容模式

filetype on "打开文件类型检测功能，它相当于文件类型检测功能的开关。
filetype plugin on "允许vim加载文件类型插件。当这个选项打开时，vim会根据检测到的文件类型，在runtimepath中搜索该类型的所有插件，并执行它们。实际上是执行$vimRUNTIME/ftplugin.vim脚本
filetype indent on "允许vim为不同类型的文件定义不同的缩进格式。这条命令也是通过一个脚本来完成加载：$vimRUNTIME/indent.vim。和”filetype plugin on“类似，它也通过设置自动命令，在runtimepath的indent子目录中搜索缩进设置。对c类型的文件来说，它只是打开了cindent选项。
autocmd FileType python setlocal et sta sw=4 sts=4 "Python 文件的一般设置，比如不要tab等

set history=50000 "设置记录的历史操作列表
set gdefault "行内替换
set langmenu=zh_CN.UTF-8 "语言设置
set helplang=cn
set laststatus=2 "总是显示状态行(默认值为1, 无法显示状态栏)
set ruler "打开光标的行列位置显示功能
set cmdheight=2 "命令行（在状态行下）的高度，默认为1，这里是2
set iskeyword+=_,$,@,%,#,- "带有如下符号的单词不要被换行分割
set linespace=0 "字符间插入的像素行数目
set wildmenu "增强模式中的命令行自动完成操作
set backspace=2 "使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l "允许backspace和光标键跨越行边界
set matchtime=20 "匹配括号高亮的时间（单位是十分之一秒）
set fillchars=vert:\ ,stl:\ ,stlnc:\ "在被分割的窗口间显示空白，便于阅读

set mouse=a "可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    
" 编码设置    
" fileformats(ffs)(vim才有)可指定多个，会依载入的档案形式来调整ff。    
" 例如:set ffs=unix, dos ff=unix则预设为unix格式，但如读入的是dos格式的    
" 档案，会自动调整为dos格式，这样存档时就会以dos格式存档。设置即为:    
" set fileformats=unix    
" set fileformat=unix并不会依据载入的档案形式来调整ff，并且只用unix形式    
" 所以，可以解决windows下的^M问题。    
" :set ff 可以查看当前文件fileformat    
" :set ffs 查看vim设置    
" 其实fileformats可以这样调整    
" set fileformats=unix,dos       这样也应该是可以解决^M问题的，让vim自动    
" 去选择是用dos，还是unix的，这应该是vim的默认设置，    
" 当然也可以选择全局替换:%s/^M//g    
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"正在被编辑的文件的编码，它也决定新文件的编码。如果为空，表示与encoding相同。如果与encoding不同，vi将会在保存和读取时做二者之间的转换。
set fileencoding=utf-8
let &termencoding=&encoding
"供vi尝试的编码列表，vi会逐个尝试每一项，如果没有发生错误，就设置当前的fileencoding为与该项相同的值。如果均失败，fileencoding将为空。
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"设置字体
"set guifont=Monaco:h9
if (has("gui_running")) 
	set guifont=Monospace\ 11
	set guifontwide=STHeiti\ 11
endif 

"set guifont=文泉驿等宽微米黑:h10
"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"set gfw=幼圆:h10.5:cGB2312

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"快捷键设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set mapleader
let mapleader = ","

"NERDTree插件
map <F1> :NERDTreeToggle<CR>

"在NERDTree显示对应文件位置
map <F2> :NERDTreeFind<CR>

"打开Tagbar插件
nmap <F3> :TagbarToggle<CR>

"cscope设置
map <F4> :cs add /home/rp/go/cscope.out<cr>

"设置F8编译程序
noremap <f8>  :call Make_Inf()<cr>

"设置F9测试程序
noremap <f9>  :call Test_Inf()<cr>

"F11设置目录为当前打开文件的路径
noremap <f11>  :cd %:h<cr>

"设置F12运行程序
noremap <f12>  :call Run_Inf()<cr>

"设置保存当前的session状态
noremap <leader>mk :mks! $VIM/my_session.vim<cr> 

"设置恢复当前的session状态
noremap <leader>ms :so $VIM/my_session.vim<cr>

"快速格式化
map <silent> <leader>F :!go fmt %<cr>

"转到下个标签页
nmap <leader>nn :tabn<cr>

"新建标签页
nmap <leader>ne :tabnew<cr>

"打开quickfix窗口
nmap <leader>lo :cw<cr>

"关闭quickfix窗口
nmap <leader>ll :cclose<cr>

" highlight cursor column
nnoremap <leader>lc :set cursorcolumn!<CR>

" 取消搜索高亮显示的结果
nnoremap <leader>ls :nohlsearch<CR>

"高亮括号
nnoremap <leader>5 :RainbowParenthesesToggleAll<CR>

" ^z快速进入shell
nmap <C-Z> :shell<cr>
" 把空格键映射成:
nmap <space> :

"自动取词翻译
nmap <s-i> :call Youdao()<cr>

" Tab和Shift-Tab缩进
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

"按两次 <Esc>退出
nnoremap  <Esc><Esc> :qa<cr>
inoremap  <Esc><Esc> <Esc>:qa<cr>

"搜索光标下文字
nmap <leader>rw :%s/\<<C-R>=expand("<cword>")<CR>\>/
"nmap <leader>gww :vimgrep <C-R>=expand("<cword>")<CR>
nmap <leader>sw :Ack <C-R>=expand("<cword>")<CR>
nmap <leader>ss :Ack 

"编译coffeescript并打开编译后的文件
nmap <leader>idd :!coffee -c %<cr>

"快速回到普通模式
inoremap jj <ESC>

"插入时间戳
nmap <leader>idt :r !date<cr>

" <leader>W 清除行尾的空白字符
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" 选中刚才粘贴的代码
nnoremap <leader>V V`]
" 格式化行
nnoremap <leader>A :%s/^\(.*\)\($\)/'\1',\2/<CR>:nohl<CR>
nnoremap <leader>B :%s/^\(.*\)\($\)/\1,\2/<CR>:nohl<CR>

"快速重新载入vimrc配置文件
"map <silent> <leader>ss :source $VIM/vimrc<cr>
"快速编辑vimrc配置文件
map <silent> <leader>ee <C-w><C-v><C-l>:e $VIM/vimrc<cr>
"当编辑vimrc配置文件后，重新载入配置。
autocmd! bufwritepost vimrc source $VIM/vimrc 

"Crl+jkhl 来切换分割的窗口
nnoremap <leader>S :ConqueTermVSplit bash<CR>

"快速定位
map F H,,f
map f ,,f

"Crl+jkhl 来切换分割的窗口
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <leader>s <C-w>s " 水平分割窗口
nnoremap <leader>v <C-w>v " 垂直分割窗口

"快速切换缓冲文件列表
nnoremap <silent> <leader>aa :bn<CR>

"切换显示主题
nnoremap <silent> <leader>t1 :colorscheme molokai <CR>
nnoremap <silent> <leader>t2 :colorscheme digerati <CR>
nnoremap <silent> <leader>t3 :colorscheme SnappyLight <CR>

"修改字体大小
nnoremap <silent> <leader>t5 :set guifont=Monospace\ 18 <CR>
nnoremap <silent> <leader>t6 :set guifontwide=STHeiti\ 18 <CR>

"ctrlp查找文件插件配置
nnoremap <silent> <leader>fb :CtrlPBuffer <CR>
nnoremap <silent> <leader>ft :CtrlPTag <CR>
nnoremap <silent> <leader>fm :CtrlPMRU <CR>
nnoremap <silent> <leader>ff :CtrlP <CR>

"映射cscope快捷键
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插件设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim "使用增强的百分号

let g:netrw_winsize = 30 "Sexplore插件设置
let g:netrw_list_hide = '^\..*' "Sexplore插件设置
let g:netrw_browse_split = 2
let g:netrw_liststyle= 3

""""""""""""""""""""""""""""""
" Tag list (ctags) 设置Taglist
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags-exuberant'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口

"ctrlp查找文件插件配置
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=30
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max = 0
"let g:ctrlp_use_caching = 1
"let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_max_files = 0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " Linux/MacOSX
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']

"ack-grep的设置
set grepprg=ack\ -a

"Powerline 的设置
let g:Powerline_symbols = 'fancy'

"设置jquery语法支持
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

"ctags安装路径
"let Tlist_Ctags_Cmd=$VIM'ctags58/ctags.exe'

"打开javascript折叠
let b:javascript_fold=1

"打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

"js语法高亮脚本的设置
let g:javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

"自动补全设置
"去掉上面的预览窗口
set completeopt=longest,menu
let g:SuperTabRetainCompletionType = 2
let g:SuperTabMappingForward="<tab>"
let g:SuperTabLongestEnhanced=1
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

"高亮括号
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0


""插件定义
"set nocompatible    " be iMproved
"filetype off        " required!

""set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

"" let Vundle manage Vundle
"" required!
"Bundle 'gmarik/vundle'

"" vim-scripts repos
"Bundle 'vim-plugin-foo'
"Bundle 'vim-plugin-bar'

""ack快速查找文字插件
"Bundle 'mileszs/ack.vim'
"Bundle 'Align'
""快速查找文件插件
"Bundle 'ctrlp'
""jQuery语法高亮插件
"Bundle 'jQuery'
"Bundle 'Powerline'
"Bundle 'minibufexpl'
""markdown语法高亮插件
"Bundle 'plasticboy/vim-markdown'
""注释插件
"Bundle 'The-NERD-Commenter'
""快速输入配对括号插件
"Bundle 'tpope/vim-unimpaired'
""高亮括号插件
"Bundle 'rainbow_parentheses.vim'
""快速输入环绕文字插件
"Bundle "tpope/vim-surround'
""重复命令插件
"Bundle "tpope/vim-repeat'

"filetype plugin indent on    " required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自定义函数
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffexpr=MyDiff()
function! MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"在所有标签页的窗口中查找指定的文件名，如果找到这样一个窗口，就跳到此窗口中；否则，它新建一个标签页来打开vimrc文件
function! SwitchToBuf(filename)
	"let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
	" find in current tab
	let bufwinnr = bufwinnr(a:filename)
	if bufwinnr != -1
		exec bufwinnr . "wincmd w"
		return
	else
		" find in each tab
		tabfirst
		let tab = 1
		while tab <= tabpagenr("$")
			let bufwinnr = bufwinnr(a:filename)
			if bufwinnr != -1
				exec "normal " . tab . "gt"
				exec bufwinnr . "wincmd w"
				return
			endif
			tabnext
			let tab = tab + 1
		endwhile
		" not exist, new tab
		exec "tabnew " . a:filename
	endif
endfunction

" lookup file with ignore case 忽略大小写的文件查找
function! LookupFile_IgnoreCaseFunc(pattern)
	let _tags = &tags
	try
		let &tags = eval(g:LookupFile_TagExpr)
		let newpattern = '\c' . a:pattern
		let tags = taglist(newpattern)
	catch
		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
		return ""
	finally
		let &tags = _tags
	endtry

	" Show the matches for what is typed so far.
	let files = map(tags, 'v:val["filename"]')
	return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

"""""""""""""""""""""""""""""""
"自动恢复上次的session状态
"""""""""""""""""""""""""""""""
function! s:ReadSession()  
	let session_file = $VIM . "/my_session.vim"  
	if filereadable( session_file )  
		execute "so " . session_file  
	endif  
endfunction

function! Test_Inf()
	execute "cd %:h"
	set makeprg=go\ test
	exec "make"
endfunction

function! Mv_cur()
	exec "make"
endfunction

function! Make_Inf()
	execute "cd %:h"
	set makeprg=go\ build
	exec "make"
endfunction

function! Run_Inf()
	set makeprg=go\ run\ %
	exec "make"
endfunction

function! Do_CsTag()
	if(executable('cscope') && has("cscope") )
		silent! execute "!find . -name '*.go'> ~/go/cscope.files"
		silent! execute "!cscope -bq"
		if filereadable("cscope.out")
			execute "cs add cscope.out"
		endif
	endif
endfunction

if has("cscope")
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	set csto=0
	set cst
	set csverb
endif


let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }

