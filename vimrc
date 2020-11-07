"                        ..
"                      .::::.
"         ___________ :;;;;:`____________
"         \_________/ ?????L \__________/
"           |.....| ????????> :.......'
"           |:::::| $$$$$$"`.:::::::' ,
"          ,|:::::| $$$$"`.:::::::' .OOS.
"        ,7D|;;;;;| $$"`.;;;;;;;' .OOO888S.
"      .GDDD|;;;;;| ?`.;;;;;;;' .OO8DDDDDNNS.
"       'DDO|IIIII| .7IIIII7' .DDDDDDDDNNNF`
"         'D|IIIIII7IIIII7' .DDDDDDDDNNNF`
"           |EEEEEEEEEE7' .DDDDDDDNNNNF`
"           |EEEEEEEEZ' .DDDDDDDDNNNF`
"           |888888Z' .DDDDDDDDNNNF`
"           |8888Z' ,DDDDDDDNNNNF`
"           |88Z'    'DNNNNNNN"
"           '"'        'MMMM"


"----------------------------
"--- Global Configurations --
"----------------------------

set nocompatible
filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-test/vim-test'
Plugin 'gioele/vim-autoswap'

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

source $VIMRUNTIME/defaults.vim
set mouse=a

"Colorscheme Management
silent! colorscheme PaperColor
set background=dark
set number

"General Indent Options
"set noexpandtab
"set copyindent
"set softtabstop=0
"set shiftwidth=4
"set tabstop=4
"set smartindent

"Specific Indent Options
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 noexpandtab

"<Leader> Key Definition
let mapleader = ","

"Auto-close preview windows
autocmd CompleteDone * pclose

"Easy ~/.vimrc configuration from CLI
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"C and C++ comments
set comments=sr:/*,m:**,ex:*/

"Buffer Management Maps
nnoremap <F5> :buffers<CR>:buffer<Space>

"NERDTree Configuration
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"VimTest Configuration
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
