set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent
set ignorecase
set smartcase
set nu

syntax on
set background=dark
"colorscheme desert
set cursorline

autocmd FileType make setlocal noexpandtab
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

"so the python comment symbol `#` doesn't get placed at the beginning of lines
inoremap # X<BS>#

autocmd BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd BufNewFile,BufRead *.pde setlocal ft=arduino
