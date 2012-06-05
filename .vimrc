syntax on
colorscheme koehler

let mapleader=","

""search tips
set incsearch
set hlsearch

""spacetabs
set expandtab
set tabstop=4
set sw=4

""folding
set foldmethod=indent
set foldlevel=99

""set autoindent
""set smartindent

""For pyflakes
filetype on
filetype plugin on
filetype plugin indent on

""Pydiction
let g:pydiction_location='~/.vim/pydiction-1.2/complete-dict'

""Display linenumbers
set number

""Display one more bottom line
set laststatus=2
""Display filename and highlight language interpreter
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\%{GitBranchInfoString()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

""Highlight current line.
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

""Templates
:autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

""Para evitar trailing de whitespaces
:highlight TrailWhitespace ctermbg=blue guibg=blue
:match TrailWhitespace /\s\+$\| \+\ze\t/

""Mapping
map <leader>t <Plug>TaskList
map <leader>1 :NERDTreeToggle<CR>
map <leader>p :ConqueTermVSplit ipython<CR>
map <leader>b :ConqueTermVSplit bash<CR>

map <leader>f :nohlsearch<CR>
set ofu=syntaxcomplete#Complete

""twitvim
let twitvim_enable_python = 1
