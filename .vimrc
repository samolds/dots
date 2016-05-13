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

syntax on
set background=dark
"colorscheme desert

"to add the column width vertical line indicator
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=7
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

autocmd BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd BufNewFile,BufRead *.pde setlocal ft=arduino
