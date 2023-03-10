


" =============== Basic Settings ==========================
set encoding =utf-8
set nocompatible                    " Disable compatibility vi (error control) 
set noswapfile                      " no swap files
syntax on                           " enable syntax
filetype on                         " enable type file detection
set number relativenumber           " relative line numbers
set history=1000                    " command history
set linebreak                       " text wrapping 
set textwidth=90                    " line length
set colorcolumn=90                  " col colour grey
set wrap                            " enable text wrapping
set breakindent                     " smart wrapping indentation
set breakindentopt=shift:4,min:40,sbr
set showbreak=++>                 " Show line break
set cursorline                      " line cursor on
set smartcase ignorecase incsearch  " text searching and highlighting
set tabstop=4 softtabstop=4         " tab settings
set expandtab shiftwidth=4 smarttab " tab settings 
set scrolloff=7                     " lines above/below cursor line
set noerrorbells                    " no ring on error
set nobackup                        " set noback (use undo instead)
set undofile undodir=~/.vim/undodir " persistent undo 
set laststatus=2                    " status line [ 0=never, 1=two_win, 2=always]
set timeoutlen=1000 ttimeoutlen=1000 " timeout for keybind presses
set wildmenu                        " auto completion menu TAB
set wildmode=list:longest           " wildmenu behave like Bash completion
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"
" Configure built-in terminal ( :term )
set termwinsize=12x0    "Set terminal size 
set splitbelow          " Open below / rather than on top

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" spell checker stuff
set spell ! spelllang=en_gb
autocmd BufNewFile, BufRead *.tex syntax sync fromstart
"
"test for highlighting
let g:gruvbox_guisp_fallback = "bg"

" colours
highlight ColorColumn ctermbg=0 guibg=lightgrey
set background=dark
" map f6 to change light to dark
nnoremap <f6> :let &bg=(&bg=='light'?'dark':'light')<cr>


" python stuff
autocmd FileType python map <buffer> <F9> :w<CR>:exec '! clear ; python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '! clear ; python3' shellescape(@%, 1)<CR>

" lua stuff
autocmd FileType lua map <buffer> <F9> :w<CR>:exec '! clear ; lua ' shellescape(@%, 1)<CR>
autocmd FileType lua imap <buffer> <F9> <esc> :w<CR>:exec '! clear ; lua ' shellescape(@%, 1)<CR>

" =============== Plugins ==========================================

call plug#begin('~/.vim/plugged')
    " colour & Themes {
     Plug 'morhetz/gruvbox'                  " Colortheme
     Plug 'luochen1990/rainbow'              " bracket colouring
    "}

    " Quality of Life {
    Plug 'ycm-core/YouCompleteMe'           "Autocomplete 
    Plug 'jiangmiao/auto-pairs'             " auto-complete brackets, etc
    Plug 'SirVer/ultisnips'                 " Ultisnips Custom snips 
    Plug 'mbbill/undotree'                  " Undotree
    Plug 'jremmen/vim-ripgrep'              " word will be searched by 'Rg'
    Plug 'rhysd/vim-grammarous'             "grammar checker for Vim
    "}
    
    Plug 'tpope/vim-fugitive'       "   
    Plug 'leafgarland/typescript-vim'
    Plug 'vim-utils/vim-man'
    Plug 'vim-syntastic/syntastic'          " ??

    " Languages {
    Plug 'sheerun/vim-polyglot'             " Language pack for syntax Highlighting
    Plug 'lervag/vimtex'                    " Latex 
    Plug 'debdeepbh/vim-matlab'             " Matlab
    Plug 'neovimhaskell/haskell-vim'        " Haskell support
    Plug 'dag/vim2hs'                       " Haskell
    Plug 'artur-shaik/vim-javacomplete2'    " java auto complete
    "}

   " File tree {
    Plug 'preservim/nerdtree'               " file manger 
   "}

   " Markdown {
    Plug 'vimwiki/vimwiki'                  " Vim wiki package(*.wiki)
    Plug 'preservim/vim-markdown'           " Markdown
    Plug 'mmai/vim-markdown-wiki'           
    "}
call plug#end( )

" Rainbow brackets
let g:rainbow_active = 1 " set to 0 to enable later
"
" vim- gramma
let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
endfunction

"" Java completion
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

"Undotree toggle
nnoremap <F5> :UndotreeToggle<CR>
"
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
let g:UltiSnipsJumpForwardTrigger="<S-z>"
let g:UltiSnipsJumpBackwardTrigger="<S-x>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
nmap <F3> :UltiSnipsEdit<CR>
if executable('rg')
    let g:rg_derive_root='true'
endif

" Vimtex config 
syntax enable
"  let g:vimtex_compiler_method='latexmk'
let g:tex_flavor='latex'
let g:vimtex_compiler_engine = 'xelatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
autocmd BufEnter *.tex map <buffer> <F9> :w <CR>:! xelatex % <CR><CR>  

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" Matlab execute file being edited with F9
autocmd BufEnter *.m map <buffer> <F9> :w <CR>:! /home/james/.matlab_bin/bin/matlab -nodesktop -nosplash -r "try, run %, pause, catch, end,quit" <CR><CR>  
let g:ycm_seed_identifiers_with_syntax =1
let g:ycm_collect_identifiers_from_tags_files = 1
autocmd BufEnter *.m compiler mlint
source $VIMRUNTIME/macros/matchit.vim

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
" my own key binds
inoremap <C-e> <Esc><S-a>;
inoremap <C-a> <Esc><S-a>
nnoremap <leader>pv :wincmd v <bar> :Ex <Bar> :vertical resize 30<CR>
nnoremap <silent> <leader> + : vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>



 


 

