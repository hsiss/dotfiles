" 用pathogen管理插件
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
 
let mapleader = ","
let g:mapleader = ","



set nocompatible


" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

" keep 50 lines of command line history
set history=50 
" show the cursor position all the time
set ruler 
" display incomplete commands
set showcmd 
" 缓冲区被修改以后切换到其他文件时隐藏,默认是删除
set hidden
" 显示空白字符，避免出现中文空白等问题
set list
" 不用备份
set nobackup

"set cursorbind    "同步显示光标
"set cursorcolumn  "显示光标列
"set cursorline    "显示光标行

" set filetype check on
filetype plugin on
filetype plugin indent on

syntax on



"Linux gVim 用如下\ 12
"set guifont=Monaco\ 12
"set guifont=Consolas\ 12
"set guifont=mingliu\ 12
"Windows gVim 用如下\ 12
"set guifont=Courier_new:h11
"set guifontwide=mingliu:h12

"Mac下字体设置
set guifont=Menlo:h14
set guifontwide=Microsoft\ YaHei:h14

"解决consle输出乱码
language messages zh_CN.utf-8 

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set guioptions-=m " 隐藏菜单栏
set guioptions-=T " 隐藏工具栏
set guioptions-=L " 隐藏左侧滚动条
set guioptions-=r " 隐藏右侧滚动条
set guioptions-=b " 隐藏底部滚动条
"  set showtabline=0 " 隐藏Tab栏

set t_Co=256
"set background=dark
"colorscheme blackboard
"colorscheme Mustang
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

"""文件编码设置
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,cp936
set encoding=utf-8
set fileformats=unix,dos,mac 


"""搜索,缩进,换行等杂项
set nowrap        " 不换行
set tabstop=2     " tab为两个空格
set backspace=indent,eol,start
                  " 退格键删除缩进,行尾,行头
set autoindent    " 自动缩进
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
"  set nonu
set shiftwidth=2  " 自动缩进的宽度
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set matchtime=5   " 显示匹配的括号0.5秒
" 搜索的时候不分大小写
"set search ignorecase
"set ignorecase
"set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

"" set tabstop value and shift width
set expandtab " 使用space代替tab. 
set tabstop=2 " tab为两个空格。 
set softtabstop=2 " 软tab为两个空格
"" setting about indent
set smartindent

" 列出空白字符
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

" 切换粘贴模式
set pastetoggle=<F2>

if has('gui_running')
  " 鼠标可用
  set mouse=a
else
  set mouse-=a
endif

""" 历史及系统信息
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

""" 不要本分和交换文件,用git代替
set nobackup
set noswapfile

""setting about old window resizing behavior when open a new window
set winfixheight
"" not let all windows keep the same height/width
set noequalalways


" 自动进入当前文件所在目录
" autocmd BufEnter * silent! lcd %:p:h

" 当前文件下按cd切换到当前目录
map <leader>cd :cd %:p:h<cr>
"map <C-t> :tabedit ./


" 设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)


" Alt-W切换自动换行,好像不管用?
"noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

" Alt-Space is System menu,修复bug,在window下Alt-Space打不开系统菜单,最大化窗口可以用Alt-Space,x
if has("gui")
  noremap <m-space> :simalt ~<cr>
  inoremap <m-space> <c-o>:simalt ~<cr>
  cnoremap <m-space> <c-c>:simalt ~<cr>
endif

""" 键映射
"避免按错键,冒号经常按
nnoremap ; :
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下是插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDTree
" autocmd VimEnter * NERDTree "启动Vim时自动打开nerdtree
" autocmd BufRead * NERDTree " 打开文件自动打开nerdtree
"let NERDTreeShowBookmarks=1 "一直显示书签
"let NERDTreeChDirMode=2 "打开书签时，自动将Vim的pwd设为打开的目录，如果你的项目有tags文件，你会发现这个命令很有帮助
"let NERDTreeQuitOnOpen=1


" ===============================================
" = CommandT
" ===============================================
"let s:ruby_path = 'E:/prog/Ruby187/bin'
"nmap <leader>t :CommandT<CR>
"nmap <leader>b :CommandTBuffer<CR>

" ===============================================
" = vimwiki
" ===============================================
"let g:vimwiki_list = [{'path': 'E:/workspaces/note/doc/wiki'}]


" ===============================================
" = 格式化
" ===============================================
nnoremap <leader>html :set filetype=xhtml<cr>
nnoremap <leader>css :set filetype=css<cr>
nnoremap <leader>js :set filetype=javascript<cr>



""" Tlist
"let Tlist_Show_One_File=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Use_Left_Window=1 
"let Tlist_Show_Menu=1
"nnoremap <silent> <F8> :TlistToggle<CR>



let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
noremap <silent> <Leader>t :TagbarOpen fjc<cr>


"""svn插件配置
" map <F9> :tabnew<CR>:read !svn diff -r HEAD<CR>:set syntax=diff buftype=nofile<CR>gg


"""fuffile配置
"nnoremap <silent> s<C-k> :FufFile<CR>
"nnoremap <silent> <leader>f :FufFile<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下是自定义函数
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ===============================================
" = 二进制编辑
" = vim -b : edit binary using xxd-format!
" ===============================================
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END


""""插件清单
"NERD_tree.vim 文件目录
noremap <silent> <Leader>f :NERDTreeFind<cr>
" Display current in NERDTree


"xiki
"let $XIKI_DIR = "/Users/zouhaisong/soft/xiki"
"source /Users/zouhaisong/soft/xiki/etc/vim/xiki.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fuzzyfinder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ,,  :FufCoverageFile!<cr>
let g:fuf_coveragefile_exclude = '^\.DS_Store$|\v\~$|\.(o|exe|dll|bak|orig|swp|png|jpg|gif)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|log|vendor)'
let g:fuf_enumeratingLimit = 500
let g:fuf_coveragefile_prompt = '=>'
let g:fuf_coveragefile_globPatterns = ['**/.*', '**/*.rb','**/*.erb','**/*.css','**/*.scss','**/*.js','**/*.yml','**/*.sql']

"fugitive.vim git插件
"Command-T 文件切换 
"dbext


"let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=dbext:passwd=dbext:dbname=renqu:extra=-t'
"let g:dbext_default_profile_mysql_local_DBI = 'type=DBI:user=dbext:passwd=dbext:driver=mysql:conn_parms=database=renqu;host=localhost'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 常用小技巧
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" 列出所有buffer
":ls 
""" 切换到指定buffer
":b<your_buffer_number>

"补全默认用ctrl+n或ctrl+p就够了





inoremap jj <ESC>
noremap <D-M-Left> :tabprevious<cr>
noremap <D-M-Right> :tabnext<cr>

map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt

noremap <Leader>5 :let @+=expand('%')<cr>
" 复制当前文件路径到系统剪切板



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 执行sql
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>ds :call SwitchDB()<CR>
:function! SwitchDB()
: let g:current_db = input("Database > ")
:endfunction

vnoremap <Leader>de :call DoQuerySelection()<CR>
:function! DoQuerySelection() range
: if !exists("g:current_db")
:   call SwitchDB()
: endif
: norm! gvy
: let query_string = @"
: if query_string != ""
:   let cmd_string = "!mysql -uroot " . g:current_db . " -e \"" . escape(query_string, "\n") . "\""
:   redir @d
:   exe cmd_string
:   redir END
: endif
:endfunction

nmap <Leader>dq :call Doquery()<CR>
:function! Doquery()
: if !exists("g:current_db")
:   call SwitchDB()
: endif
: let query_string = input(g:current_db . " > " )
: redir @d
: if query_string != ""
:   exe "!mysql -uroot " . g:current_db . " -e \"" . escape(query_string, "'") . "\""
: endif
: redir END
:endfunction

