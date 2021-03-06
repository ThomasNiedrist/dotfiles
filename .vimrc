"color vim-framer-syntax
syntax on
set number
set tabstop=4
set relativenumber
set incsearch
set hlsearch

" move by one line
nnoremap j gj
nnoremap k gk

highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNR term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE


if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ycm-core/YouCompleteMe'
Plug 'wikitopian/hardmode'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'skammer/vim-css-color'
call plug#end()

imap <special><F8> <Esc> :w<CR>
nmap <special><F9>  <F8> :VimtexCompile<CR>
imap <special><F9>  <F8> :VimtexCompile<CR>
nmap <special><F7> :!make <CR> 

"Vim Latex"
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_method='latexmk'

"Statusbar"
set noshowmode
set laststatus=2
"CppSyntax"
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let mapleader = ';'

set completeopt-=preview

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
inoremap <leader>; <C-x><C-o>

let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

"Hardmode"
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Don''t use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

"GitGutter
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '✱'
let g:gitgutter_sign_removed = '➖ '
let g:gitgutter_sign_removed_first_line = '⑴'
let g:gitgutter_sign_modified_removed = 'ww'
autocmd VimEnter * :GitGutterEnable

"Goyo
nnoremap <special><F12> :Goyo <CR>

"limelight
let g:limelight_conceal_ctermfg = 11
let g:limelight_conceal_guifg = 'Yellow'

"Linewidth
highlight ColorColumn ctermbg=7
set colorcolumn=80


" Nerdtree
"autocmd vimenter * NERDTree

"Ultisnips
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"color
"autocmd vimenter * colorscheme gruvbox
"let g:gruvbox_contrast_dark='hard'
"set background=dark
"let g:gruvbox_invert_selection=0
"let g:gruvbox_italicize_strings=1
"colorscheme gruvbox
"autocmd BufEnter * colorscheme gruvbox
autocmd BufEnter *.tex colorscheme vim-framer-syntax 

set t_Co=256		"enable 256 colors
