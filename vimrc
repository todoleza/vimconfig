" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
execute pathogen#infect()

runtime macros/matchit.vim        " Load the matchit plugin.

"set cursorcolumn " show vertical column on cursor
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=2                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title
"if has('mouse')
"    set mouse=a                   " Enable mouse in terminal
"endif

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" ^^ obsoleted by airline plugin

" Or use vividchalk
colorscheme murphy

" Tab mappings.
map <leader>tt :tabnew<lf>
map <leader>te :tabedit
map <leader>tc :tabclose<lf>
map <leader>to :tabonly<lf>
map <leader>tn :tabnext<lf>
map <leader>tp :tabprevious<lf>
map <leader>tf :tabfirst<lf>
map <leader>tl :tablast<lf>
map <leader>tm :tabmove

" visualize trailing spaces
set listchars=tab:▸\ ,trail:·
set list

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

inoremap <C-U> <C-G>u<C-U>

