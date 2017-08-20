if $VIM_PLUGINS != 'NO'
  runtime! autoload/pathogen.vim
  if exists('g:loaded_pathogen')
    execute pathogen#infect('~/.vimbundles/{}', '~/.vim/bundle/{}')
  endif
endif

syntax on
filetype plugin indent on

set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

set guifont=Anonymous\ Pro\ for\ Powerline:h12
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=/bin/bash

:nmap , \

" yank until end of line
nnoremap Y y$

" don't overwrite buffer on paste
" xnoremap p "_dP

" simplify split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" vim tab navigation
nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>

" disable arrow navigation keys
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Left>  <NOP>
noremap   <Right> <NOP>

" show line numbers
set number
" set relativenumber number

" Better search behavior
set hlsearch
set incsearch "show next match when entering a search
set ignorecase
set smartcase

" Unhighlight search results
map <Leader><space> :nohl<cr>

" Don't scroll off the edge of the page
"set scrolloff=5

" This uses Ack.vim to search for the word under the cursor
" let g:ackprg = 'ag --vimgrep'
nnoremap <leader><bs> :Ag! '\b<c-r><c-w>\b'<cr>

" NERDTree configuration
let NERDTreeIgnore=['\~$', 'tmp', '\.git$', '\.bundle', '.DS_Store', '.swp', '\.happypack', 'flow-typed']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0
map <Leader>n :NERDTreeToggle<CR>
map <Leader>fnt :NERDTreeFind<CR>

" split windows
nnoremap <C-w>- :spl<cr>
nnoremap <C-w><bar> :vsp<cr>

set softtabstop=2 shiftwidth=2 expandtab

colorscheme Tomorrow-Night-Eighties

" command-t config
map <C-c> :CommandT<CR>
map <C-b> :CommandTBuffer<CR>
map <C-f> :CommandTFlush<CR>
let g:CommandTTraverseSCM="pwd"
let g:CommandTFileScanner="git"
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTMatchWindowAtTop=1
let g:CommandTMatchWindowReverse=0
let g:CommandTWildIgnore=&wildignore . ",node_modules/**,**/node_modules/**,dist/**,lib/**,coverage/**,packages/**/lib/**,**/node_modules,flow-typed/**,.happypack/**"
let g:CommandTHighlightColor="Search"

" Disable vim backups
set nobackup
set nowritebackup

" Disable swapfile
set noswapfile

" airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" QuickFix navigation
map <C-n> :cn<CR>
map <C-p> :cp<CR>
nnoremap <LEFT> :cprev<CR>
nnoremap <RIGHT> :cnext<CR>

" keep foreground commands in sync
map fg <c-z>

" save with enter
nmap <CR> :write!<CR>
cabbrev w nope

" jsx syntax
let g:jsx_ext_required = 0

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-l>"

function! s:Pulse()
  setlocal cursorline
  redraw
  sleep 100m

  setlocal nocursorline
  redraw
  sleep 100m

  setlocal cursorline
  redraw
  sleep 100m

  setlocal nocursorline
  redraw
endfunction
autocmd FocusGained * call s:Pulse()

" hardmode
let g:hardtime_default_on = 0
let g:hardtime_ignore_quickfix = 1
let g:hardtime_showmsg = 1
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "k", "l"]
let g:hardtime_ignore_buffer_patterns = [ "NERD.*", "*.txt", ".vimrc", '.git/index', '.git/COMMIT_EDITMSG' ]

" eslint
" let g:syntastic_javascript_checkers = ['eslint', 'flow']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_aggregate_errors = 1
let g:flow#enable = 0

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:validator_filetype_map = {"javascript.jsx": "javascript"}
" let g:validator_javascript_checkers = ['eslint']
" let g:validator_error_msg_format = "[ ● %d/%d issues ]"
" let g:validator_auto_open_quickfix = 1

autocmd BufNewFile,BufRead *.scss             set ft=scss.css

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
