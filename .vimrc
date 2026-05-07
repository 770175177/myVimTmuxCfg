call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'				" 目录树
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }	" 模糊查找插件
Plug 'jiangmiao/auto-pairs'				" 括号匹配
Plug 'vim-airline/vim-airline'				" 底部状态美化
Plug 'vim-airline/vim-airline-themes'			" 美化
Plug 'preservim/nerdcommenter'				" 快速注释
" Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
							" 预览markdown
Plug 'majutsushi/tagbar'				" 浏览当前文件的标签
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" 模糊搜索
Plug 'junegunn/fzf.vim'					" 模糊搜索
Plug 'embear/vim-localvimrc'
Plug 'ycm-core/YouCompleteMe'				" 补全插件
Plug 'mhinz/vim-startify'				" 浏览最近浏览文件
Plug 'lfv89/vim-interestingwords'			" 单词高亮

call plug#end()

" basic setting
set nu
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key

" tab space set
set tabstop=4      " 显示制表符为 4 空格宽度
set shiftwidth=4   " 自动缩进时使用 4 空格
set expandtab      " 将 Tab 转换为空格
set softtabstop=4  " 退格键删除 4 个空格 

" ctrl+n to open nerdtree
map <C-n> :NERDTreeToggle<CR>
" 打开vim时,自动打开NERDTree
" autocmd vimenter * NERDTree
" 窗口是否显示行号
" let g:NERDTreeShowLineNumbers=1

" vim-airline
" set laststatus=2				"永远显示状态栏
" let g:airline_powerline_fonts = 1		" 支持 powerline 字体
" let g:airline#extensions#tabline#enabled = 1	" 显示窗口tab和buffer
" let g:airline_theme = 'murmur'			" murmur配色

" if !exists('g:airline_symbols')
" let g:airline_symbols = {}
" endif
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '❮'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'

" nerdcommenter
filetype plugin on
" comment ,cc in visual mode, uncomment is ,cu
let mapleader=","
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" MarkdonPreview
" map <F3> :MarkdownPreview<CR>		" 设置 F3 开启 Markdown 文件预览
" let g:mkdp_auto_start = 0		"打开文件后自动弹出, 0 为否
" let g:mkdp_auto_close = 1		"关闭文件后自动关闭预览窗口, 1 为是
" let g:mkdp_refresh_slow = 1		"慢速预览, 修改后退出 insert 模式后方会刷新视图, 1 为是
" let g:mkdp_open_to_the_world = 0	"开启公网链接, 0 为否
" let g:mkdp_browser = ''			"指定浏览器, 默认会跟随系统浏览器
" let g:mkdp_port = ''			" 指定端口, 默认随机端口
" let g:mkdp_page_title = '「${name}」'	"指定浏览器窗口标题, 默认为 Markdown 文件名
" :MarkdownPreview : 开启预览
" :MarkdownPreviewStop : 停止预览
" :MarkdownPreviewTroggle : 开关预览

" 通过ctrl+m 键来开启和关闭Tagbar
nnoremap <C-m> :TagbarToggle<CR>
" 设置tagbar使用的ctags的插件,必须要设置对
" let g:tagbar_ctags_bin='/usr/bin/ctags'
" 设置tagbar的窗口宽度
let g:tagbar_width=30
" 设置tagbar的窗口显示的位置,为左边  
" let g:tagbar_left=1
let g:tagbar_right=1

" vim-startify
" ctrl+ to open vim-startify
map <C-o> :Startify<CR>

" interestingwords 
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

" fzf
" 启用模糊搜索
set rtp+=~/.fzf
if executable('fzf')
  command! -bang -nargs=* Files call fzf#vim#files(<q-args>)
  command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'))
endif

