# My vim config

This is my current vim config that I used to work. Using vim seriously since 2011 & I luv it :D. (GVim, MacVim and vim-terminal for OSX and Linux distros)

## Requirements

###### vim+python
Most of plugins needs vim+python, it's very common this configuration in vim versions except vim in OSX (use MacVim or install vim+python using [this link](http://mikegrouchy.com/blog/compile-vim-with-python-on-osx-with-homebrew.html).

###### flake8
Use `pip install flake8`

###### ipython
I use ConqueTerm with iPython. `pip install ipython`

###### ctags
For TagList plugin.

## Plugins used

### Using Pathogen
These plugins are installed using pathogen in `.vim/bundle` directory. 

- **calendar-vim**: Wonderful calendar `,k` <https://github.com/mattn/calendar-vim>
- **ctrlp**: Beautiful file opener `:Ctrlp.` <https://github.com/kien/ctrlp.vim.git>
- **jedi-vim**: Good python autocomplete, `,8` <https://github.com/davidhalter/jedi-vim.git>
- **vim-flake8**: python PEP8 helper <https://github.com/nvie/vim-flake8.git>
- **vim-json**: Json colored syntax <https://github.com/leshill/vim-json>
- **vim-surround**: Awesome surround text plugin <git://github.com/tpope/vim-surround.git>
- **vim-game-of-life**: Game of life, a plugin to procrastinate :) <https://github.com/vim-scripts/vim-game-of-life.git>
- **tetris.vim**: Tetris, another one if you are stuck on something <git://github.com/vim-scripts/TeTrIs.vim.git> `,te`

#### How to install these plugins?
In root repository:

    git submodule init
    git submodule update

### No Pathogen
- **ConqueShell**: `,b` for bash, `,p` for iPython console <http://www.vim.org/scripts/script.php?script_id=2771>
- **NerdTree**: Tree directory tab `,1`
- **snipMate**:
- **Templates directory**:
- **Twitvim**: Twitter vim console <http://vim.sourceforge.net/scripts/script.php?script_id=2204>
- **Taglist**: View your classes and methods in a split. `,m` <http://www.vim.org/scripts/script.php?script_id=273>
- **Tasklist**: `,t`
- **vim-markdown-extra-preview**: Generate Markdown preview in your browser. `:Me` and `:Mer` <git://github.com/sigilioso/vim-markdown-extra-preview.git>
- **colors**: blackboard for Gvim and MacVim and koehler for vim in terminal.
- Sure I've missed something else...




