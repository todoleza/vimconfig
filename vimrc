" vim: ts=2 sw=2 :
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline' ", { 'rev' : 'v0.7' }
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'Valloric/YouCompleteMe', {
\ 'build'      : {
   \ 'mac'     : './install.py',
   \ 'unix'    : './install.py',
   \ 'windows' : 'install.py',
   \ 'cygwin'  : './install.py'
   \ }
\ }
NeoBundle 'rking/ag.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'jamessan/vim-gnupg'
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'

call neobundle#end()

NeoBundleCheck

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
"execute pathogen#infect()

if executable('ag')
  let g:ackprg = 'ag --column'
endif
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
set confirm
"if has('mouse')
"    set mouse=a                   " Enable mouse in terminal
"endif
if &term=~'xterm'
    set t_Co=256
    let g:solarized_termcolors=256
endif
set background=dark
colorscheme solarized

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
" colorscheme murphy

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

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

command! StripTrailingSpaces call Preserve("%s/\\s\\+$//e")

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:neobundle#types#git#enable_submodule = 1
let g:neobundle#install_process_timeout = 1500
let g:GPGExecutable = 'gpg2'
