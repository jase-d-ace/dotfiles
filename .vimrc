" Welcome to Jase's .vimrc! This looks way too weird without some sort of
" introduction or something to start... idk...
set wrap
set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set splitbelow
set splitright
set hlsearch
set smartcase
set backspace=indent,eol,start
set updatetime=100
set clipboard=unnamedplus

" use ctrl-n to open nerdtree
map <C-n> :NERDTreeToggle<CR>

" easy switching between panes
nnoremap <C-y> <C-y>

" open up a blank vertical buffer
noremap <C-m> :vnew<cr>

" allow me to use ;; to get out of any mode
imap ;; <Esc>
vmap ;; <Esc>

" ctrl-g deletes a line
map <C-g> "_d

" use \cd to use switch active directory to your current nerdTREE directory
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" configuration for omnisharp autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
set completeopt=menuone,noinsert,noselect,preview

" use \vp to enter quick terminal commands and put them in a new tmux buffer
map <leader>vp :VimuxPromptCommand<cr>

" use \t combos to open multiple tabs
map <leader>tt :tabnew<CR>
map <leader>tx :tabclose<CR>
map <leader>tl :tabnext<CR>
map <leader>th :tabp<CR>

"use \jd to insert JSDoc comments on top of a function
map <leader>jd :JsDoc<CR>

" use \y to copy to clipboard
map <leader>y :w !clip.exe <CR>
"use \fz to open up my fuzzy finder
map <leader>fz :FZF<cr>

" use \sy to check syntax
map <leader>sy :SyntasticCheck<cr>

" use \sr to close syntastic linting window
map <leader>sr :SyntasticReset<cr>

" change cursor shape depending on current mode
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required
syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin that transpiles babel
Plugin 'pangloss/vim-javascript'

Plugin 'maxmellon/vim-jsx-pretty'

" syntax checker
Plugin 'scrooloose/syntastic'

" C# syntaxing
Plugin 'csharp.vim'

" C# dev stuff
Plugin 'omnisharp/omnisharp-vim'

" build tool
Plugin 'tpope/vim-dispatch'

" autocomplete
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'

" Go syntaxing
Plugin 'fatih/vim-go'

" plugin that tracks my file structure
Plugin 'scrooloose/nerdtree'

" nerdtree git tracker
Plugin 'Xuyuanp/nerdtree-git-plugin'

" CSS Color tracker
Plugin 'ap/vim-css-color'

" theme pack
Plugin 'rafi/awesome-vim-colorschemes'

" plugin that does my comments for me
Plugin 'tpope/vim-commentary'

Plugin 'heavenshell/vim-jsdoc'

" plugin that autocompletes, hopefully
Plugin 'cohama/lexima.vim'

" buffer manager
Plugin 'jeetsukumaran/vim-buffergator'

" plugin that helps with rails
Plugin 'tpope/vim-rails'

"plugin to support ruby
Plugin 'vim-ruby/vim-ruby'

" plugin for markdown
Plugin 'tpope/vim-markdown'

" git support
Plugin 'tpope/vim-fugitive'

" more tmux and vim integration. geez this is a lot of work.
Plugin 'tmux-plugins/vim-tmux'

" JSON stuff
Plugin 'elzr/vim-json'

" git status line
Plugin 'airblade/vim-gitgutter'

" status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'marciomazza/vim-brogrammer-theme'

" easy navigation between vim and tmux
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" plugin for even easier vim and tmux interaction
Plugin 'benmills/vimux'

call vundle#end()            " required

" Put your non-Plugin stuff after this line

"""""COLOR SCHEME STUFF"""""""""""
" colorscheme brogrammer
" colorscheme default
" colorscheme jellybeans
" colorscheme hybrid
colorscheme onedark

set t_Co=256
set background=dark

if (has('termguicolors'))
  set termguicolors
endif

let base16colorspace=256


" To ignore plugin indent changes, instead use:
"filetype plugin on

let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

let g:gitgutter_enabled=1
let g:gitgutter_signs=1
" Airline stuff
set laststatus=2

let g:NERDTreeWinSize=30

set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Use the stdio version of OmniSharp-roslyn:
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1

let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_additional_descriptions = 1
let g:javascript_plugin_jsdoc = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
