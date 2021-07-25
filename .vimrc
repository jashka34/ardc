syntax on                                   " включить подсветку синтаксиса
colorscheme elflord
set number                                  " показывать номера строк
set numberwidth=4                           " количество цифр в номерах строк
inoremap jj <Esc>                           " выход из режима Insert по jj - чтобы не тянуться к клавише Esc
set fileformat=unix
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
" set keymap=russian-jcukenwin                " что-то улучшающее работу с русскими клавишами
set iminsert=0
set imsearch=0
set ruler                                   " в подстрочнике для каждого окна будет выводится инфа о % просмотренного
set hlsearch                                " установка постоянной подстветки последнего поиска (выключается :noh)
set shiftwidth=4                            " размер индента (работает по >)
set tabstop=4                               " Определяет ширину символа табуляции.
set smarttab                                " Когда жмёшь Tab добавляет пробелы в количестве shiftwidth (проверить так ли это)
set expandtab                               " Ставим табы пробелами (на количество пробелов указанных в tabstop)
set softtabstop=4                           " 4 пробела в табе
set autoindent                              " После Enter строка начинается с индента предыдущей
set nobackup
set noswapfile
highlight lCursor guifg=NONE guibg=Cyan     
" nmap <Tab> <C-W><C-W>
nmap <Tab>l <C-W>l                          " переключение между окнами по Tab-hjkl (потому что Ctrl-W hjkl неудобно)
nmap <Tab>k <C-W>k
nmap <Tab>j <C-W>j
nmap <Tab>h <C-W>h

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
call vundle#end() 
filetype plugin indent on

