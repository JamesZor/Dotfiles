set encoding =utf-8

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

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


call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vimtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'

call plug#end()
" youcompleteme remove the preview window pop.
set completeopt-=preview
autocmd vimenter * ++nested colorscheme gruvbox

 colorscheme gruvbox

"set background=dark

"snaps config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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



" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-

let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_bannaer = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching =0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v <bar> :Ex <Bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader> + : vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>



nnoremap <leader>u :UndotreeShow<CR>

" change esc to caps 
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


