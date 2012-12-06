syntax on
if has("gui_running")
  colorscheme blackboard
else
  colorscheme koehler
endif
hi Search cterm=NONE ctermfg=grey ctermbg=blue

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
if has("gui_macvim")
  " set macvim specific stuff
  set visualbell
endif
set novisualbell
set noerrorbells
set vb t_vb=
au GUIEnter * set vb t_vb=

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

set autoindent
set smartindent

""Vim does not support backspace in Insert Mode (vim terminal OSX)
set backspace=indent,eol,start

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
noremap <Leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

""For pyflakes
filetype on
filetype plugin on
filetype plugin indent on

""Pydiction
""let g:pydiction_location='~/.vim/pydiction-1.2/complete-dict'



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

"" Svn blame using visual selection
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

"" Not pop-up on dot jedi-vim
let g:jedi#popup_on_dot = 0
"" Not show function definition
let g:jedi#show_function_definition = "0"

"" ctrlp in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

""Para evitar trailing de whitespaces
highlight TrailWhitespace ctermbg=blue guibg=blue
match TrailWhitespace /\s\+$\| \+\ze\t/

call pathogen#infect()
""Surround helpers
"" t
autocmd FileType htmldjango let b:surround_116 = "{% trans \"\r\" %}"
"" T
autocmd FileType htmldjango let b:surround_84 = "{% blocktrans %}\r{% endblocktrans %}"
"" c
autocmd FileType htmldjango let b:surround_99 = "{# \r #}"
"" C
autocmd FileType htmldjango let b:surround_67 = "{% comment %}\n\r\n{% endcomment %}"

""Mapping
map <leader>t <Plug>TaskList
map <leader>1 :NERDTreeToggle<CR>
map <leader>p :ConqueTermVSplit ipython<CR>
map <leader>b :ConqueTermVSplit bash<CR>

map <leader>f :nohlsearch<CR>
map <leader>m :TlistToggle<CR>
""Note -- <leader>te Open Tetris
map <leader>k :Calendar<CR>
"":Gol - Game of life
""Flake 8 Pep8
autocmd FileType python map <buffer> <leader>8 :call Flake8()<CR>

" Fast saving
nmap <leader>w :w!<cr>

""set ofu=syntaxcomplete#Complete

""twitvim
let twitvim_enable_python = 1

""80 characters vertical line
""highlight ColorColumn ctermbg=grey ctermfg=white guibg=grey guifg=white
""set colorcolumn=80

map <leader>s :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

""Copy/Paste Clipboard
nmap <leader>v "+gP
imap <leader>v <ESC><C-V>i
vmap <leader>c "+y

nnoremap <leader>+ :call MoveToNextTab()<CR>
nnoremap <leader>- :call MoveToPrevTab()<CR>

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'Paste! '
    en
    return ''
endfunction

function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
