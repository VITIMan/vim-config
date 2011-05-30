colorscheme koehler

let mapleader=","

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
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

""Highlight current line.
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

map <leader>t <Plug>TaskList

set ofu=syntaxcomplete#Complete
