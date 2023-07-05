call plug#begin(stdpath('data') . '/plugged')
	" File Explorer
	Plug 'preservim/nerdtree'
	" Theme
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
	" Plug 'nanotech/jellybeans.vim'
	" syntax
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Plug 'maxmellon/vim-jsx-pretty'
	" Plug 'mxw/vim-jsx'
	Plug 'mattn/emmet-vim'
	Plug 'chun-yang/auto-pairs'
  " Langugue	
	Plug 'pangloss/vim-javascript'
	" Plug 'numirias/semshi', {'do':'UpdateRemotePlugins', 'for':['python']}
	" Comment
	Plug 'tpope/vim-commentary'
	" CSS color
	Plug 'ap/vim-css-color'
	" airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'	
	
	Plug 'preservim/tagbar'
	" Debugging
	Plug 'puremourning/vimspector'

	" telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" icons
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()


syntax on
set number

set mouse=a

" Theme -------------------------------------------------------
colorscheme onehalfdark
let g:airline_theme='onehalfdark' 

" set t_Co=256
" colorscheme jellybeans


" Tap ----------------------------------------------------------
set tabstop=4
set shiftwidth=4
set smarttab 
set autoindent
set cindent


" Cursor -------------------------------------------------------
set cursorline
hi CursorLine term=bold cterm=bold 


" Default split method -----------------------------------------
set splitright
set splitbelow


" Key mapping --------------------------------------------------
imap jk <ESC>


" Terminal -----------------------------------------------------
function! OpenTerminal()
	split term://zsh
	resize 8
endfunction
nnoremap <c-z> :call OpenTerminal() <CR>


" NERDTree -----------------
nnoremap <C-b> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20
" nnoremap <C-f> :NERDTreeFind<CR>
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif


" airline ------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#formatter = 'default'
nnoremap <silent><C-h> :bp<CR>
nnoremap <silent><C-l> :bn<CR>


" tagbar -------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=40

" JS intellisense & syyntax highlighting -----------------------
let g:coc_global_extensions = ['coc-eslint', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver',  'coc-import-cost',  'coc-clangd', 'coc-clojure']

" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif


" semshi
" let g:python3_host_prog = substitute(system("which python3"), '\n\+$', '', '')

let g:python3_host_prog = "/usr/bin/python3"
	
" Debugging
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dl :call vimspector#Launch()<CR>
nmap <leader>dr :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
nmap <leader>di <Plug>VimspectorBalloonEval
xmap <leader>di <Plug>VimspectorBalloonEval
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]
let g:vimspector_base_dir='/Users/yunminhui/.local/share/nvim/plugged/vimspector'

" python 자동실행  -----------------------------------------------
autocmd FileType python map <buffer> <F10> :w<CR> :term python3 %<CR>
autocmd FileType python imap <buffer> <F10> :w<CR> :term python3 %<CR>
autocmd FileType python map <buffer> <F9> :w<CR> <c-z>python3 `ls -tr\|tail -1`<CR>
autocmd FileType python imap <buffer> <F9> :w<CR> <c-z>python3 `ls -tr\|tail -1`<CR>


" Find files using Telescope command-line sugar. ----------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

