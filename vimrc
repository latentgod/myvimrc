set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"





" ----------------The following was written by mine------
"  base configuration
filetype plugin on                        " 自动检测文件类型并加载相应的设置
filetype indent on                        " 自动检测文件类型并加载相应的设置
set wrap "自动折行当一行超过屏幕显示了,自动换行
set foldmethod=syntax "设置自动折叠代码
" 基于缩进或语法进行代码折叠
set foldmethod=indent
" 启动 vim 时关闭折叠代码
set nofoldenable
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent "自动缩排  
set ruler "可显示最后一行的状态  
set showmode "左下角那一行的状态  
set nu "可以在第一行的最前面显示行号  
  
" Encoding related  
set encoding=UTF-8  
set langmenu=zh_CN.UTF-8  
language message zh_CN.UTF-8  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1  
set fileencoding=utf-8  
  
" 修正易错命令
command -bang -nargs=* Q q<bang>
command -bang -nargs=* Wa wa<bang>
command -bang -nargs=* WA wa<bang>
command -bang -nargs=* -complete=file W w<bang> <args>
command -bang -nargs=* -complete=file Wq wq<bang> <args>
command -bang -nargs=* -complete=file WQ wq<bang> <args>
set t_Co=256
if exists("tags")                        " 启动vim时，如果存在tags则自动加载
	    set tags=tags
    endif
    if &term=="xterm"
	        set t_Co=8
		    set t_Sb=^[[4%dm
		        set t_Sf=^[[3%dm
		endif
		nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python





"+++++++++++++++++++++++++++++++++++++++++++++ vim plugin +++++++++++++++++++++++++++++++++++++++++++++++++++
"----nerdtree---------
Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

"----YouCompleteMe
"Bundle 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = '/home/si/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_key_invoke_completion = '..'
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
""在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 
""离开插入模式后自动关闭预览窗口
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"

"-----------------------neocomplete--------------------
"Bundle 'Shougo/neocomplete.vim'
"let g:neocomplete#enable_at_startup = 1


"-----------------------neocomplcache---neocomplete best-----
Bundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
          return neocomplcache#smart_close_popup() . "\<CR>"
            " For no inserting <CR> key.
              "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
          endfunction
          " <TAB>: completion.
          inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
          " <C-h>, <BS>: close popup and delete backword char.
          inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
          inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
          inoremap <expr><C-y>  neocomplcache#close_popup()
          inoremap <expr><C-e>  neocomplcache#cancel_popup()
          " Close popup by <Space>.
          "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

          " For cursor moving in insert mode(Not recommended)
          "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
          "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
          "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
          "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
          " Or set this.
          "let g:neocomplcache_enable_cursor_hold_i = 1
          " Or set this.
          "let g:neocomplcache_enable_insert_char_pre = 1

          " AutoComplPop like behavior.
          "let g:neocomplcache_enable_auto_select = 1

          " Shell like behavior(not recommended).
          "set completeopt+=longest
          "let g:neocomplcache_enable_auto_select = 1
          "let g:neocomplcache_disable_auto_complete = 1
          "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

          " Enable omni completion.
          autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
          autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
          autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
          autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
          autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

          " Enable heavy omni completion.
          if !exists('g:neocomplcache_force_omni_patterns')
                let g:neocomplcache_force_omni_patterns = {}
            endif
            let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
            let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
            let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

            " For perlomni.vim setting.
            " https://github.com/c9s/perlomni.vim
            let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"------supertab--------------
Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"


"-------------------tagbar-------------
Bundle 'majutsushi/tagbar'
nmap <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

"-----------------multiple-cursors-----
Bundle 'terryma/vim-multiple-cursors'

"----youdao-translater-----
Bundle 'ianva/vim-youdao-translater'
vnoremap <silent> <C-T> <Esc>:Ydv<CR> 
nnoremap <silent> <C-T> <Esc>:Ydc<CR> 
noremap zq :Yde<CR>

"------syntastic-----------------
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers = ['php',' phpmd']


"------emmet-------------
Bundle 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'

"-----pydiction-----
Bundle "rkulla/pydiction"
filetype plugin on
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 25

"----------kien/ctrlp.vim----------
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-g>'
let g:ctrlp_cmd = 'CtrlP'

noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"-----nvie/vim-flake8---
Bundle 'nvie/vim-flake8'
"<F7> to work

" php completion funclist.txt   
"au FileType php call AddPHPFuncList()
"function AddPHPFuncList()
"    set dictionary-=~/.vim/bundle/funclist.txt dictionary+=~/.vim/bundle/funclist.txt
"    set complete-=k complete+=k
"endfunction
"
"-----maksimr/vim-jsbeautify   (format the compress code,examples: compress bootstrap.min.css) 
Bundle 'maksimr/vim-jsbeautify'
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


"let mapleader=","  "I don't know this set what means









