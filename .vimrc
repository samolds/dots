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

set t_Co=256
syntax on
set background=dark
"colorscheme desert

"to add the column width vertical line indicator
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=8
  set colorcolumn=80
else
 au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"to not convert \t to '  ' in Makefiles
autocmd FileType make setlocal noexpandtab

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

autocmd BufNewFile,BufRead *.md setlocal ft=markdown
autocmd BufNewFile,BufRead *.ts setlocal ft=typescript
autocmd BufNewFile,BufRead *.tsx setlocal ft=typescript

"for 'vim-plug'
"1. install ~/.vim/autoload/plug.vim from https://github.com/junegunn/vim-plug
"2. download everything with ':PlugInstall'
call plug#begin('~/.vim/vimplug_plugins')
Plug 'fatih/vim-go', { 'tag': 'v1.24', 'do': ':GoUpdateBinaries' }
call plug#end()

"vim-go specific
let g:go_echo_command_info = 0
let g:go_def_reuse_buffer = 0
"let g:go_bin_path = ""
let g:go_def_mapping_enabled = 1

au FileType go nmap gd <Plug>(go-def)
au FileType go nmap gs <Plug>(go-def-split)
au FileType go nmap gv <Plug>(go-def-vertical)
