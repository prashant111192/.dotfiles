" 1 Plugin manager (Plug)
"{{{

" Autoinstalls Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" for the task line below
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'        " the line
Plug 'fneu/breezy'                  " Colour scheme
Plug 'dylanaraps/wal.vim'

" Plug 'ghifarit53/tokyonight-vim'
Plug 'tpope/vim-fugitive'           " Git wrapper
Plug 'vim-scripts/tComment'         " l-c comments
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'Yggdroot/indentLine'          " the lines for indent
Plug 'sbdchd/neoformat'

" Plug 'rakr/vim-one'
" Plug 'altercation/solarized'
" Plug 'junegunn/fzf' , { 'dir': '~/.fzf', 'do': './install --bin' }
" Plug 'junegunn/fzf.vim' " Fuzzy finder
" syntax check
" Plug 'w0rp/ale'
" Plug 'maximbaz/lightline-ale'
" Plug 'JuliaEditorSupport/julia-vim'
" Plug 'petRUShka/vim-opencl'
" Plug 'neomake/neomake'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete phrases
" Plug 'zchee/deoplete-clang' " C++ autocomplete
" Plug 'davidhalter/jedi' " Python autocomplete
" Plug 'zchee/deoplete-jedi'
" Plug 'Shougo/neoinclude.vim'
" Plug 'JuliaEditorSupport/deoplete-julia' , { 'for': 'julia' }
call plug#end()
" }}}

" 2 Basic Settings
" {{{
set encoding=utf-8 " Enable unicode support
syntax enable " Enable custom colors
set exrc " Source config file from working directory if present
set secure " Restrict usage of some commands in non-default config files

" Call the theme one
" colorscheme breezy
colorscheme wal
" set background=dark

" This line enables the true color support.
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
" set termguicolors

" set t_Co=256
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm"
set number
set linebreak
set tabstop=4 " columns a tab counts for
set softtabstop=4 " columns vim uses when Tab hit in insert mode
set shiftwidth=4 " columns text is indented with reindent operations
set expandtab " set tabwidth to 4 white spaces
set conceallevel=0

"set clipboard+=unnamed	    " allow to use system clipboard
"set lazyredraw		    " don't redraw while executing macros for better performace
set ignorecase		    " ignores cases while searching
set smartcase " makes search case sensitive if it contains an uppercase letter
"set nohlsearch		    " don't highlight after search
"set foldmethod=marker	    " markers define folds
set noshowmode " don't show "INSERT" et al. in last row (since it's in powerline)
" set autowriteall          " save file when changing or opening another one
set hidden " disable autosave when changing buffer
"filetype plugin on
"filetype indent on

" }}}

" 3 Keymaps
" {{{
let mapleader = "\<Space>"  " set leader key

"nnoremap ; :
"nnoremap vv ^vg_
" Yank and paste for clipboard
"vmap <C-c> "+y<CR>
"nmap <C-v> "+p
map <leader>c :TComment<CR>
"buffer/tabs shortkeys
"nmap <leader>T :enew<CR>
nmap <leader>j :bnext<CR>
nmap <leader>k :bprevious<CR>
"nmap <leader>w :bp <BAR> bd #<CR>
" Move visual block
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv
" Start substitute on current word under the cursor
"nnoremap ,s :%s///gc<Left><Left><Left>
" }}}

" 4 Pugin Settings
" {{{

" lightline
let g:lightline = {
      \ 'colorscheme': 'breezy',
      \ 'component_function': {
      \     'filename': 'LightLineFilename',
      \     'gitbranch': 'FugitiveHead',
      \     'bufferinfo': 'lightline#buffer#bufferinfo',
      \ }
      \ }
" \ 'colorscheme': 'one', Add for lightline colurscheme one
let g:lightline_buffer_modified_icon = '\u26a1'

function! LightLineFilename()
    return expand('%:P:f')
endfunction

" indentline
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" deoplete
let g:deoplete#enable_at_startup=1
" let g:deoplete#enable_refresh_always=1
" let g:deoplete#file#enable_buffer_path=1
let g:deoplete#max_list=5
" set completeopt-=preview
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" " Tab completion
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" completion for tex
"if !exists('g:deoplete#omni#input_patterns')
"    let g:deoplete#omni#input_patterns = {}
"endif
"let g:deoplete#omni#input_patterns.tex = 
"	    \   '\\(?:'
"	    \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
"	    \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
"	    \  .  '|hyperref\s*\[[^]]*'
"	    \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"	    \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
"	    \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"	    \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
"	    \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
"	    \  .')'

"set completeopt-=preview

" deoplete clang
" let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
" let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

" neoinclude
"let g:neoinclude#_paths = '/home/stephan/documents/Master/libroyale/include/royale'

"julia-vim
"let g:latex_to_unicode_auto = 1

" neoterm
"let g:neoterm_position = 'vertical'
"let g:neoterm_automap_keys = ',tt'
"nnoremap <silent> <f10> :TREPLSendFile<cr>
"nnoremap <silent> <f9> :TREPLSendLine<cr>
"vnoremap <silent> <f9> :TREPLSendSelection<cr>
"nnoremap <silent> <f8> :call neoterm#toggle()<cr>

" neomake
" let g:neomake_python_enabled_makers = ['flake8']
" let g:neomake_tex_enabled_makers = ['chktex']
" nnoremap <f5> :Neomake<cr>

" Vimtex options
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname= 'nvr' " workaround for neovim
" let g:vimtex_quickfix_enabled = 1
" let g:vimtex_quickfix_latexlog = {'fix_paths':0}
" let g:vimtex_quickfix_mode = 2 " open immediately but don't focus
let g:vimtex_view_method = 'zathura'
" let g:vimtex_latexmk_options = '-verbose -file-line-error -interaction=nonstopmode -synctex=1 -pvc -shell-escape'
let g:vimtex_latexmk_options = '-pvc'
let g:vimtex_mappings_enabled = 0
let g:vimtex_fold_enabled = 0
let g:vimtex_fold_env = 0

nmap <leader>l :VimtexCompile<CR>
nmap <leader>v :VimtexView<CR>
nmap <leader>e :VimtexErrors<CR>



" For MARKDOWN
" autocmd FileType markdown let g:indentLine_enabled=0
let g:indentLine_fileTypeExclude = ['markdown']

" Ale
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_linters = {'python': ['flake8']}
" fzf
"nnoremap <leader>s :FZF<cr>

" }}}

