set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent
set ignorecase
set smartcase
set number
set cursorline
set nohlsearch
set splitbelow
set splitright

syntax on
set background=dark
"colorscheme desert

"to add the column width vertical line indicator
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=1
  set colorcolumn=80
else
 au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"to not convert \t to '  ' in Makefiles
autocmd FileType make setlocal noexpandtab

"to autoindent in python files
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

"so the python comment symbol `#` doesn't get placed at the beginning of lines
inoremap # X<BS>#

"change split navigation key mapping to be more similar to screen
  "unmap new window <C-W>n to <C-W>c
  nnoremap <C-W><C-C> <C-W><C-N>
  nnoremap <C-W>c <C-W>n
  "move circular right
  nnoremap <C-W><C-N> <C-W><C-W>
  nnoremap <C-W>n <C-W>w
  "move to previous
  nnoremap <C-W><C-W> <C-W><C-P>
  nnoremap <C-W>w <C-W>p
  "move left
  nnoremap <C-W><C-P> <C-W><C-H>
  nnoremap <C-W>p <C-W>h

autocmd BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd BufNewFile,BufRead *.pde setlocal ft=arduino
