call plug#begin("~/.config/nvim/plugged")
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#Install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'vim-utils/vim-man'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
Plug 'vuciv/vim-bujo'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'diepm/vim-rest-console'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()"Config Section

syntax on

set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent smartindent
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set clipboard=unnamedplus
filetype plugin indent on "enable filetype and indentation detection

imap jk <Esc>
imap kj <Esc>

nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDTreeIgnore = ['^node_modules$']

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set termguicolors
colorscheme gruvbox
set background=dark

" map leader to space
let mapleader = " "

" use tab to switch buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" PLUGIN: FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>pf :Files<CR>
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>/ <Leader>c<space><CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" Replacing grep with rg
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
"nmap <leader>gc :GCheckout<CR>
nmap <leader>ga :Git fetch --all<CR>
nmap <leader>gc :GBranches<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


nnoremap <silent> K :call CocAction('doHover')<CR>
" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Bunjo Todos
" :Todo
" :Todo g
"
" Change bujo window size
let g:bujo#window_width = 50
" Insert a new task
nmap <C-S> <Plug>BujoAddnormal
imap <C-S> <Plug>BujoAddinsert
" Check offf a task
nmap <C-Q> <Plug>BujoChecknormal
imap <C-Q> <Plug>BujoCheckinsert

let g:vrc_output_buffer_name = '__VRC_OUTPUT.<filetype>'

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
