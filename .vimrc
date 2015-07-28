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

autocmd FileType make setlocal noexpandtab
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
