syntax on
set t_Co=256
colorscheme koehler

let mapleader=","

set incsearch
set hlsearch

set expandtab
set tabstop=4
set sw=4
""set autoindent
""set smartindent

""For pyflakes
filetype on
filetype plugin on
filetype plugin indent on

set number

""Display one more bottom line
set laststatus=2
""Display filename and highlight language interpreter
""set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\%{GitBranchInfoString()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

""Templates
:autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

" Avoiding whitespace trailing 
:highlight TrailWhitespace ctermbg=blue guibg=blue
:match TrailWhitespace /\s\+$\| \+\ze\t/

"Pydiction files location
let g:pydiction_location = '~/.vim/pydiction_files/complete-dict'


""Highlight current line.
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

""Mapping
map <leader>t <Plug>TaskList
map <leader>1 :NERDTreeToggle<CR>    
map <leader>p :ConqueTermVSplit ipython<CR>

map <leader>f :nohlsearch<CR>
set ofu=syntaxcomplete#Complete
