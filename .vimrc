 "====== Basic Configuration ======
set number             		 " 显示行号
set cursorline             	 " 突出显示当前行
hi Cursorline cterm=bold ctermbg=black ctermfg=green guibg=green "粗体显示选中行，用黑色框，字体标绿
set cursorcolumn             " 设置列高亮
hi Cursorcolumn cterm=bold ctermbg=black ctermfg=green guibg=green "粗体显示选中列，用黑色框，字体标绿
set autoindent 		         " 自动缩进
set cindent
set tabstop=4 				 " Tab键的宽度
set softtabstop=4 		     " 统一缩进为4
set shiftwidth=4
set expandtab 			 " 不要用空格代替制表符 或者使用expandtab将tab保存为space
set smarttab 			     " 在行和段开始处使用制表符
set ignorecase 			     "搜索忽略大小写
set hlsearch 			     "搜索逐字符高亮
set incsearch 			     "增强搜索
set smartindent 			 " 提供自动缩进
syntax on					 " 语法高亮


" 突出显示81列
set textwidth=80
set colorcolumn=+1

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'majutsushi/tagbar'
  Plug 'preservim/nerdcommenter'
call plug#end()

"====== NERDTREE configuration ======
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"====== NERDTREE configuration ======
nnoremap <C-b> :TagbarToggle<CR> 

"====== cscope configuration ======
" 指定了执行cscpoe的命令
" csto 值决定了:cstag执行查找的顺序。为0则cscope数据将会被优先查找，然后才会查找tag文件。为1，则查找顺序相反。默认值是0
" cscopequickfix指定了是否使用quickfix窗口来显示cscope的结果

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0  " cscope数据将会被优先查找
    set nocsverb

    " 添加当前目录下的数据库
    if filereadable("cscope.out")
        cs add cscope.out
    " 添加环境变量中指定的数据库
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    set cscopequickfix=s-,g-,c-,f-,t-,d-,i-,e-,a-

    " 快捷键映射
    nnoremap <leader>fs :cs find s <c-r>=expand("<cword>")<cr><cr>:copen<cr>  " 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
    nnoremap <leader>fg :cs find g <c-r>=expand("<cword>")<cr><cr>:copen<cr>  " 查找函数、宏、枚举等定义的位置
    nnoremap <leader>fd :cs find d <c-r>=expand("<cword>")<cr><cr>:copen<cr>  " 查找本函数调用的函数
    nnoremap <leader>fc :cs find c <c-r>=expand("<cword>")<cr><cr>:copen<cr>  " 查找调用本函数的函数
    nnoremap <leader>ft :cs find t <c-r>=expand("<cword>")<cr><cr>:copen<cr>  " 查找指定的字符串
    nnoremap <leader>fe :cs find e <c-r>=expand("<cword>")<cr><cr>:copen<cr>  " 查找egrep模式，相当于egrep功能，但查找速度快多了
    nnoremap <leader>ff :cs find f <c-r>=expand("<cfile>")<cr><cr>:copen<cr>  " 查找并打开文件，类似vim的find功能
    nnoremap <leader>fi :cs find i <c-r>=expand("<cfile>")<cr><cr>:copen<cr>  " 查找包含本文件的文件

    nnoremap <c-j> :cnext<cr>      " 切换至下一个cscopequickfix的搜索结果 映射为 ctrl+j
    nnoremap <c-k> :cprev<cr>      " 切换至上一个cscopequickfix的搜索结果 映射为 ctrl+k

    nnoremap <leader>t :copen<cr>  " 打开cscopequickfix窗口
    autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
endif

