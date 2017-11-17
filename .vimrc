call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'tpope/vim-obsession'

Plug 'scrooloose/syntastic'

Plug 'morhetz/gruvbox'

Plug 'roxma/vim-paste-easy'

Plug 'MattesGroeger/vim-bookmarks'

Plug 'haya14busa/incsearch.vim'

call plug#end()

let g:airline_theme='bubblegum'

"How many lines of history vim remembers
set history=50

set listchars=eol:↵,tab:\ \ 
set list

"Remove all trailing whitespace on write
fun! TrimWhitespace()
	let l:save = winsaveview()
	%s/\s\+$//e
	call winrestview(l:save)
endfun
autocmd BufWritePre *.py :call TrimWhitespace()
autocmd BufWritePre *.c :call TrimWhitespace()
autocmd BufWritePre *.h :call TrimWhitespace()
autocmd BufWritePre *.java :call TrimWhitespace()

"Enable filetype plugins
filetype plugin on
filetype indent on

"Setting colorschemes
set background=dark
"let g:gruvbox_italic=1
colorscheme gruvbox

"Automatically read when the file is changed from another source
set autoread

"Enable syntax highlighting
syntax enable

"Auto completion for the command line
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn

"Enhance searching
set hlsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
let g:incsearch#consistent_n_direction = 1

"Enhanced bookmarks settings
let g:bookmark_auto_close = 1
let g:bookmark_save_per_working_dir = 1

"Show 256 colors
set t_Co=256
set t_ut=

"set utf8 as standard encoding
set encoding=utf8

"No reason for any backups, since everything is just on remote repos anyway
set nobackup
set nowb
set noswapfile

"Status line setup
set ruler
set laststatus=2
set statusline=CWD:%h%m%F%r\ \ Line:\ %l\ Col:\ %c

"Show linenumbers and highlight curentline
set number
set cursorline

"Enable using the mouse
set mouse=a

"Highlight lines after 80 columns
"match ErrorMsg '\%>80v.\+i'
set colorcolumn=80

"Set shifts and indents to width=4
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set autoindent
set smartindent

"Faster moving with C-arrow keys
nnoremap <silent> <C-Up> 10k
nnoremap <silent> <C-Down> 10j

"Setting auto wrapping of brackets, parens, braces, and qoutes.
"Also sets up escaping from those brackets, parens, braces, and quotes.
inoremap (<CR> ()<Esc>i
inoremap {<CR> {<CR><Backspace>}<Esc>O
inoremap [<CR> []<Esc>i
inoremap "<CR> ""<Esc>i
inoremap '<CR> ''<Esc>i
inoremap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

vnoremap <C-c> "+y

"Stop python comments from getting put backwards
inoremap # X#

"Show matching brackets
set showmatch
set mat=2
