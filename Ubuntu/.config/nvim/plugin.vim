" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/powerline', {'rtp': '/home/jerome/.pyenv/versions/3.7.3/lib/python3.7/site-packages/powerline/bindings/vim/'}

" Initialize plugin system
call plug#end()
