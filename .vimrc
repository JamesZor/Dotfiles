set encoding =utf-8

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Configure built-in terminal ( :term )
set termwinsize=12x0    "Set terminal size 

set splitbelow          " Open below / rather than on top

" Enable type file detection. Vim will be able to try to detect the type of
" file in use.
 filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on
syntax on
filetype plugin indent on


set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set cursorline

set laststatus=2 " status line [ 0=never, 1=two_win, 2=always]

" spell checker stuff
set spell ! spelllang=en_gb
autocmd BufNewFile, BufRead *.tex syntax sync fromstart
"test for highlighting
let g:gruvbox_guisp_fallback = "bg"
" Enable auto completion menu after pressing TAB.
 set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
"
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" python stuff
autocmd FileType python map <buffer> <F9> :w<CR>:exec '! clear ; python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '! clear ; python3' shellescape(@%, 1)<CR>

" lua stuff
autocmd FileType lua map <buffer> <F9> :w<CR>:exec '! clear ; lua ' shellescape(@%, 1)<CR>
autocmd FileType lua imap <buffer> <F9> <esc> :w<CR>:exec '! clear ; lua ' shellescape(@%, 1)<CR>

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'          " Colortheme
Plug 'jremmen/vim-ripgrep'      
Plug 'tpope/vim-fugitive'       "   
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vimtags'
Plug 'ycm-core/YouCompleteMe'   "Autocomplete 
Plug 'mbbill/undotree'          " Undotree
Plug 'lervag/vimtex'            " 
Plug 'vim-syntastic/syntastic'  " ??
Plug 'SirVer/ultisnips'         " Ultisnips Custom snips 
Plug 'vimwiki/vimwiki'          " Vim wiki package ( *.wiki)
Plug 'sheerun/vim-polyglot'     " Language pack for syntax Highlighting
Plug 'jiangmiao/auto-pairs'    " auto-complete brackets, etc
Plug 'preservim/nerdtree'       " file manger 
Plug 'artur-shaik/vim-javacomplete2'    " java auto complete
Plug 'raingo/vim-matlab'       " Matlab syntax support.
"Plug 'neovimhaskell/haskell-vim'      " Haskell support
Plug 'dag/vim2hs'
call plug#end()
" Java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable
" youcompleteme remove the preview window pop.
set completeopt-=preview
autocmd vimenter * ++nested colorscheme gruvbox
" Set colour scheme for default - use (:color *)
colorscheme gruvbox
"Auto-pair set toggle
let g:AutoPairsShortcutToggle = '<C-P>'

" haskell-vim
let g:haskell_conceal_wide = 1
"let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo`and `rec`
"let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"let g:haskell_backpack = 1                " to enable highlighting of backpackkeywords
"let g:haskell_classic_highlighting = 1"

"Undotree toggle
nnoremap <F5> :UndotreeToggle<CR>
"
"set background=dark
" Nerdtree file manager configs
let NERDTreeShowBookmarks = 1   "Show the bookmark table
let NERDTreeShowHidden = 1      "Show hidden files
let NERDTreeShowLineNumbers = 0 "Hide line numbers
let NERDTreeShowMinimalMenu = 1 "Use the minimal menu(m)
let NERDTreeWinPos = "left"     " Panel opens on the left handside 
let NERDTreeWinSize = 31        " Set panel width to 31 col
nmap <F2> :NERDTreeToggle <CR>
"snaps config
let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/plugin/UltiSnips.vim "
let g:UltiSnipsExpandTrigger="<S-q>"
let g:UltiSnipsJumpForwardTrigger="<S-f>"
let g:UltiSnipsJumpBackwardTrigger="<S-.>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
nmap <F3> :UltiSnipsEdit<CR>
set background=dark
" map f6 to change light to dark
nnoremap <f6> :let &bg=(&bg=='light'?'dark':'light')<cr>

if executable('rg')
    let g:rg_derive_root='true'
endif

syntax enable
"  let g:vimtex_compiler_method='latexmk'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" Matlab execute file being edited with F9
map <buffer> <F9> :w <CR>:!matlab -nodesktop -nosplash -r "try, run %, pause, catch, end,quit" <CR><CR> 
let g:ycm_seed_identifiers_with_syntax =1
let g:ycm_collect_identifiers_from_tags_files = 1
autocmd BufEnter *.m compiler mlint
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-

" Set space as the leader key.
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_bannaer = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching =0
" Undotree - mbbill
nnoremap <leader>u :UndotreeShow<CR>
" Split movement
nnoremap <leader>j <c-w>h
nnoremap <leader>k <c-w>l

" tabs move
nnoremap <leader>h :tabp<CR>
nnoremap <leader>l :tabn<CR> 

" spelling
nnoremap <leader>c @='[sz='<CR> 
inoremap <C-e> <Esc><S-a>;<CR>
inoremap <C-a> <Esc><S-a>
nnoremap <leader>pv :wincmd v <bar> :Ex <Bar> :vertical resize 30<CR>
nnoremap <silent> <leader> + : vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>



 


 

