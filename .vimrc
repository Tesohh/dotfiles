" Vim settings AAAAA
set background=dark
set number relativenumber

set directory^=$HOME/.vim/swap// " swap files get saved in ~/.vim/swap

set noshowmode " Sets to not show the --insert-- at the bottom

set tabstop=4
set shiftwidth=4
set expandtab

" Plugin configuration
"" airline
let g:airline#extensions#tabline#enabled = 1

"" Gruvbox
let g:gruvbox_contrast_dark = 'soft'
colo gruvbox

" Plugs
call plug#begin()
Plug 'vim-airline/vim-airline'
call plug#end()

set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
let g:airline_extensions = []
