syntax on
colorscheme blackboard

let mapleader=","

if has("gui_running")
  highlight TrailWhitespace ctermbg=blue guibg=blue
  match TrailWhitespace /\s\+$\| \+\ze\t/
  ""80 characters vertical line
  highlight ColorColumn ctermbg=grey ctermfg=white guibg=grey guifg=white
  set colorcolumn=80
  ""GUI is running or is about to start.
  ""Maximize gvim window.
  set lines=999 columns=999
  " Removing bars and scroll bars
  set guioptions-=m ""remove menu bar
  set guioptions-=T ""remove tool bar
  set guioptions+=LlRrb ""add scroll lines
  set guioptions-=LlRrb ""remove scroll lines

endif


""no bells
set visualbell
set noerrorbells

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

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Ignore files
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*~

" Don't redraw while executing macros (good performance config)
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

""For pyflakes
filetype on
filetype plugin on
filetype plugin indent on

""Pydiction
let g:pydiction_location='~/.vim/pydiction-1.2/complete-dict'

""Display linenumbers
set number

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Display one more bottom line
set laststatus=2
""Display filename and highlight language interpreter
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\%{GitBranchInfoString()}\ %{HasPaste()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

""Highlight current line.
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

""Highlight *.md files in markdown
au BufNewFile,BufRead *.md set filetype=markdown

""Templates
:autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

""Para evitar trailing de whitespaces
highlight TrailWhitespace ctermbg=blue guibg=blue
match TrailWhitespace /\s\+$\| \+\ze\t/

""Mapping
map <leader>t <Plug>TaskList
map <leader>1 :NERDTreeToggle<CR>
map <leader>p :ConqueTermVSplit ipython<CR>
map <leader>b :ConqueTermVSplit bash<CR>

map <leader>f :nohlsearch<CR>
map <leader>m :TlistToggle<CR>
""Note -- <leader>te Open Tetris
map <leader>k :Calendar<CR>

" Fast saving
nmap <leader>w :w!<cr>

set ofu=syntaxcomplete#Complete

""twitvim
let twitvim_enable_python = 1

""80 characters vertical line
highlight ColorColumn ctermbg=grey ctermfg=white guibg=grey guifg=white
set colorcolumn=80

""Copy/Paste Clipboard
nmap <leader>v "+gP
imap <leader>v <ESC><C-V>i
vmap <leader>c "+y

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'Paste! '
    en
    return ''
endfunction

