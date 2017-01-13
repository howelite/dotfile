set nocompatible              " be iMproved, required
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
" 插件列表
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Chiel92/vim-autoformat' "C: astyle python: autopep8
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'w0ng/vim-hybrid'
Plugin 'rdnetto/YCM-Generator'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'vim-airline/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " required

" vim-indent-guides
" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
" 色块宽度
"let g:indent_guides_guide_size=1

" 剪切模式
set pastetoggle=<F9>

" move
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" 记录上次编辑位置
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif


" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' "YCM配置全局路径
let g:ycm_warning_symbol = '>*'
let g:ycm_seed_identifiers_with_syntax=1 "输入一个字符后开始补全
let g:ycm_confirm_extra_conf = 0 "加载本地配置时不用确认
let g:ycm_complete_in_comments = 1 "注释也能补全
let g:ycm_complete_in_strings = 1 "字符串中也能补全
let g:ycm_key_invoke_completion = "<F2>" "全能补全
"let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview


" Autoformat
noremap <F3> :Autoformat<CR>
let g:formatters_python = ['autopep8']

" goto function
function! GoToDef()
    if &ft == 'go'
        execute 'GoDef'
    else
        execute 'YcmCompleter GoToDefinitionElseDeclaration'
    endif
endfunction
nnoremap ; :call GoToDef()<CR>

" NERDTree
" nmap <F7> :NERDTree<CR>
autocmd vimenter * NERDTree " enable on start
autocmd VimEnter * wincmd p " move cursor to center
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "当退出最后一个VIM窗口时也退出NERDTree
let NERDTreeMinimalUI=1 " disable help info
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.pyc$', '\~$', '\.o$'] " ignore files

" Tagbar
nmap <F8> :Tagbar<CR>
let g:tagbar_compact=1

" VIM-go
let g:go_fmt_command = "goimports" " import on save
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" disable golang highlight error
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0

" nerdcommenter
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" normal 
set nu
set ruler
set nobackup
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
syntax enable
syntax on
filetype indent on
set autoindent
set incsearch
set hlsearch
set ignorecase
set nowrapscan
set expandtab
set laststatus=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouse=a
set cul
set scrolloff=3
set t_Co=256
set background=dark
colorscheme hybrid 
