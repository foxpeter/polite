"���������������
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set modelines=0
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
colo desert
set nobackup
set autoindent
set guioptions-=T
set modelines=0

"���������������
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,big5
set termencoding=utf-8
set encoding=prc

"����tab���
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set statusline=%<[%n]\%F\%h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][ASCII=\%03.3b]\%-10.(%l,%c%V%)\%P

set relativenumber
"set undofile

let mapleader = ","

"ѱ��Vim��Ĭ������������ʽ
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

au FocusLost * :wa


nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>

"tab�л�
map <C-right>   :tabnext<cr>
map <C-left>   :tabprevious<cr>

 "ƥ�����ŵĹ����������html��<>
set matchpairs=(:),{:},[:],<:>
"���˸񣬿ո����¼�ͷ����������βʱ�Զ��Ƶ���һ�У�����insertģʽ��
set whichwrap=b,s,<,>,[,]

"��ʼ���ڵĿ��
set columns=175
"��ʼ���ڵĸ߶�
set lines=45
"��ʼ���ڵ�λ��
winpos 52 42

"Nerd tree
nmap <silent> <leader>nt :NERDTree .<cr>

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

