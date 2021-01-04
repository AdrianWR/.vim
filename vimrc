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

call plug#begin()
	Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'
	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'jiangmiao/auto-pairs'
	Plug 'vim-test/vim-test'
	Plug 'gioele/vim-autoswap'
	Plug 'pbondoer/vim-42header'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

source $VIMRUNTIME/defaults.vim
set mouse=a

"Colorscheme Management
silent! colorscheme PaperColor
set background=dark
set number

"<Leader> Key Definition
let mapleader = ","

"General Indent Options
set noexpandtab
set copyindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set smartindent

"Specific Indent Options
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 noexpandtab

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
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"VimTest Configuration
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"Airline Configuration
let g:airline_powerline_fonts = 1

"Coc.Nvim Configuration
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
