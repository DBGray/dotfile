"=============================================================================
"     FileName: .vimrc
"         Desc: my VIM configuration file.
"       Author: David Gray
"        Email: david.gray@dr-inc.com
"     HomePage: http://www.dr-inc.com
"      Version: 0.0.1
"   LastChange: 2012-06-01 16:57:41
"      History:
"=============================================================================
" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax on
" filetypes
filetype plugin on
filetype indent on
" ~/.vimrc ends here
"--- my stuff --- {{{
autocmd filetype python set expandtab
autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="E501,W293"  
" Avoid accidental hits of <F1> while aiming for <Esc>
map! <F1> <Esc>
" Vim behaviour {{{
" set hidden           " hide buffers instead of closing them this means 
                       " that the current buffer can be put to background 
 	               " without being written; and that mark
	               " and undo history are preserved 
set switchbuf=useopen  " reveal already opened files from the quickfix 
                       " window instead of opening new buffers 
set history=1000       " remember more commands and search history
set undolevels=1000    " use many muchos levels of undo
if v:version >= 730
  set undofile         " keep a persistent backup file
  set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup           " do not keep backup files, it's 70's style cluttering
set noswapfile         " do not write annoying intermediate swap files,
                       "  who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp " store swap files in one of
                                     " these directories 
                                     " (in case swapfile is ever turned on)
set viminfo='20,\"80   " read/write a .viminfo file, don't store 
                       " more than 80 lines of registers
set wildmenu           " make tab completion for files/buffers act like bash
set wildmode=list:full " show a list when pressing tab and 
                       " complete first full match
set wildignore=*.swp,*.bak,*.pyc,*.class 
set title              " change the terminal's title
set visualbell         " don't beep 
set noerrorbells       " don't beep 
set showcmd            " show (partial) command in the last line of 
                       " the screen this also shows visual selection info
set nomodeline         " disable mode lines (security measure)
set ttyfast            " always use a fast terminal
set laststatus=2       " tell VIM to always put a status line in, even
                       "    if there is only one window
" Editing behaviour {{{
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
"set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
"set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                " case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according
                                " to shiftwidth, not tabstop
set scrolloff=2                 " keep 4 lines off the edges of the screen when scrolling
"set virtualedit=all             " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms 
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set nolist                      " don't show invisible characters by default, 
                                " but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to paste
                                " mode, where you can paste mass data that won't
                				" be autoindented 
set mouse=                      " enable using the mouse if terminal emulator
                                " supports it (xterm does)
set fileformats="unix,dos,mac" 
set formatoptions+=1            " When wrapping paragraphs, don't end lines with
                                " 1-letter words (looks stupid)
set nrformats=                  " make <C-a> and <C-x> play well with zero-padded
                                " numbers (i.e.  don't consider them octal or hex)

" AuthorInfo stuff need NERD commenter
let g:vimrc_author='David Gray'
let g:vimrc_email ='david.gray@dr-inc.com'
let g:vimrc_homepage='http://www.dr-inc.com'

nmap <F4> :AuthorInfoDetect<CR>
" }}} --- end my stuff ---
