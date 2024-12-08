" -----------------------------------------------------------------------------
" Description
" -----------------------------------------------------------------------------
" This .vimrc file contains the following contents:
" - Plugins
" - General settings
" - File Tree View (netrw)
" - Auto commands
" - Session Saving
" - Custom Keybinds
" - Input settings
" - Tab's number settings
" - Search settings
" - Appearance settings

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

call plug#begin()

" Colorscheme
Plug 'sjl/badwolf'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'wadackel/vim-dogrun'
Plug 'whatyouhide/vim-gotham'
Plug 'catppuccin/vim', {'as': 'catppuccin'}
" Editing Support
Plug 'tpope/vim-repeat'
Plug 'obcat/vim-hitspop'
Plug 'tpope/vim-surround'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-commentary'
Plug 'gosukiwi/vim-smartpairs'
Plug 'junegunn/vim-easy-align'
Plug 'dominikduda/vim_current_word'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'ntpeters/vim-better-whitespace'
Plug 'skanehira/denops-translate.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
" User Interface
Plug 'obcat/vim-sclow'
Plug 'pacha/vem-tabline'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"fern
Plug 'lambdalisue/vim-fern'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/vim-nerdfont'
Plug 'lambdalisue/vim-glyph-palette'
Plug 'lambdalisue/vim-fern-git-status'
Plug 'brandon1024/fern-renderer-nf.vim'
" Vim controlling
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'simeji/winresizer'
Plug 'pbogut/fzf-mru.vim'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
" Coding
" general
Plug 'vim-denops/denops.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'akaimo/asyncomplete-around.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
" markdown (.md)
Plug 'mattn/vim-maketable'
Plug 'preservim/vim-markdown'
Plug 'bullets-vim/bullets.vim'
Plug 'i9wa4/vim-markdown-number-header'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" csv (.csv)
Plug 'mechatroner/rainbow_csv'

call plug#end()

" Colorscheme -----------------------------------------------------------------
colorscheme gotham
" colorscheme one
" colorscheme ayu
" let ayucolor="mirage"
" colorscheme dogrun
" colorscheme onedark
" colorscheme badwolf
" colorscheme catppuccin_mocha

" vim-airline/vim-airline -----------------------------------------------------
let g:airline_theme  = 'gotham'
" let g:airline_theme  = 'distinguished'

" Plugin's commands -----------------------------------------------------------
nnoremap <silent> ff :Files<CR>
nnoremap <silent> fg :GFiles<CR>
nnoremap <silent> fr :RG<CR>
nnoremap <silent> fm :FZFMru<CR>
nnoremap <silent> <C-t> :FloatermToggle<CR>
tnoremap <silent> <C-t> <C-\><C-n>:FloatermToggle<CR>
let mapleader = "\<Space>"
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gr :LspRename<CR>
nnoremap <silent> gh :LspHover<CR>
nnoremap <silent> gj :LspNextDiagnostic<CR>
nnoremap <silent> gk :LspPreviousDiagnostic<CR>
nnoremap <silent> gf :LspDocumentFormat<CR>
nnoremap <Silent> <C-e> :WinResizerStartResize<CR>
noremap <silent><C-o> :Fern . -drawer -toggle<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <silent> ge <Plug>Markdown_EditUrlUnderCursor

" liuchengxu/vim-which-key ----------------------------------------------------
let g:which_key_ignore_outside_mappings = 1
let g:which_key_vertical = 1
let g:which_key_map = {}
let g:which_key_map['c'] = {
      \ 'name' : '+csv' ,
      \ 'a' : [':RainbowAlign',  'RainbowAlign: Add extra spaces to align columns'],
      \ 'A' : [':RainbowShrink', 'RainbowShrink: Delete all extra spaces'],
      \ 'l' : [':CSVLint',       'CSVLint: Check CSV format'],
      \ }
let g:which_key_map['e'] = {
      \ 'name' : '+etc' ,
      \ 'a' : [':LiveEasyAlign',         'LiveEasyAlign (<C-p>): Align lines with delimiter (interactive)'],
      \ 's' : [':StripWhitespace',       'StripWhitespace: Delete all trailing spaces'],
      \ 'd' : [':GitGutterDiffOrig',     'GitGutterDiffOrig: Show git dif'],
      \ 't' : ['<Plug>(Translate)',      'Translate: Translate line(s), Input y to yank result'],
      \ 'w' : [':WinResizerStartResize', 'WinResizerStartResize (<C-e>): Start window resize mode'],
      \ }
let g:which_key_map['f'] = {
      \ 'name' : '+fzf' ,
      \ 'f' : [':Files',       'Files (ff): Search Files in the CD'],
      \ 'm' : [':FZFMru',      'FZFMru (fm): Search MRU'],
      \ 'M' : [':FZFFreshMru', 'FZFFreshMru : Search/Refresh MRU with Fresh list'],
      \ 'g' : [':GFiles',      'GFiles (fg): Search Files in the Git repo'],
      \ 'r' : [':RG',          'RG (fr): Search Strings in the CD'],
      \ 'c' : [':Colors',      'Colors: Search installed colorschemes'],
      \ }
let g:which_key_map['g'] = {
      \ 'name' : '+lsp' ,
      \ 'd' : [':LspDefinition',         'LspDefinition (gd): Go to the definition of the word'],
      \ 'r' : [':LspRename',             'LspRename (gr): Rename symbol'],
      \ 'h' : [':LspHover',              'LspHover (gh): Show hover information'],
      \ 'j' : [':LspNextDiagnostic',     'LspNextDiagnostic (gj): Jump to next diagnostics'],
      \ 'k' : [':LspPreviousDiagnostic', 'LspPreviousDiagnostic (gk): Jump to previous diagnostics'],
      \ 'f' : [':LspDocumentFormat',     'LspDocumentFormat (gf): Format the document'],
      \ 'i' : [':LspInstallServer',      'LspInstallServer: Install Language Server'],
      \ 'u' : [':LspUninstallServer',    'LspUninstallServer: Unstall Language Server'],
      \ 'm' : [':LspManageServers',      'LspManageServers: Manage Language Servers'],
      \ }
let g:which_key_map['m'] = {
      \ 'name' : '+Markdown' ,
      \ 't' : [':Tocv',                     'Tocv: Create vertical TOC'],
      \ 'T' : [':Toch',                     'Toch: Create horizontal TOC'],
      \ 'i' : [':InsertToc',                'InsertToc: Insert TOC'],
      \ 'm' : [':MakeTable!',               'MakeTable!: Make table from CSV'],
      \ 'M' : [':UnmakeTable',              'UnmakeTable: Convert table to CSV'],
      \ 'f' : [':TableFormat',              'TableFormat: Format table under the cursor'],
      \ 'r' : [':RenumberList',             'RenumberList: Renumber number list'],
      \ 'R' : [':RenumberSelection',        'RenumberSelection: Renumber number list in selection'],
      \ 'c' : [':ToggleCheckbox',           'ToggleCheckbox: Toggle marker the nearest checkbox'],
      \ 'p' : [':MarkdownPreview',          'MarkdownPreview: Preview markdown file on the default browser'],
      \ 'n' : [':NumberHeader',             'NumberHeader: Number to headers'],
      \ 'N' : [':call UnNumberHeader()',    'call UnNumberHeader(): Unnumbers from headers'],
      \ }
let g:which_key_map['p'] = {
      \ 'name' : '+Plug' ,
      \ 'i' : [':PlugInstall', 'PlugInstall: Install listed plugins'],
      \ 'c' : [':PlugClean',   'PlugClean: Uninstall unlisted plugins'],
      \ 'd' : [':PlugDiff',    'PlugDiff: Show diff Pre/Post editing'],
      \ 'u' : [':PlugUpdate',  'PlugUpdate: Update/Install listed plugins'],
      \ 'U' : [':PlugUpgrade', 'PlugUpgrade: Update vim-plug itself'],
      \ }
let g:which_key_map['z'] = {
      \ 'name' : '+Fold' ,
      \ 'f' : ['zf', '(zf): Create fold'],
      \ 'D' : ['zD', '(zD): Delete all fold'],
      \ 'k' : ['zk', '(zk): Close fold'],
      \ 'j' : ['zj', '(zj): Open one fold'],
      \ 'J' : ['zJ', '(zJ): Open all fold'],
      \ 'h' : ['zh', '(zh): Collapse one fold in the page'],
      \ 'H' : ['zH', '(zH): Collapse all fold in the page'],
      \ 'l' : ['zl', '(zl): Open one fold in the page'],
      \ 'L' : ['zL', '(zL): Open all fold in the page'],
      \ }
call which_key#register('<Space>', "g:which_key_map")

" lambdalisue/vim-fern --------------------------------------------------------
let g:fern#default_hidden = 1
let g:fern#renderer = 'brandon1024/fern-renderer-nf.vim'
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" prabirshrestha/vim-lsp ------------------------------------------------------
nnoremap <expr><c-j> lsp#scroll(+4)
nnoremap <expr><c-k> lsp#scroll(-4)
inoremap <expr><c-j> lsp#scroll(+4)
inoremap <expr><c-k> lsp#scroll(-4)
let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 0

" prabirshrestha/asyncomplete.vim ---------------------------------------------
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

" akaimo/asyncomplete-around.vim ----------------------------------------------
call asyncomplete#register_source(asyncomplete#sources#around#get_source_options({
    \ 'name': 'around',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#around#completor'),
    \ }))
" prabirshrestha/asyncomplete-file.vim ----------------------------------------
call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" whatyouhide/vim-lengthmatters -----------------------------------------------
let g:lengthmatters_use_textwidth = 0
let g:lengthmatters_start_at_column = 80
let g:lengthmatters_highlight_one_column = 1
call lengthmatters#highlight('ctermbg=0 ctermfg=7')

" dominikduda/vim_current_word ------------------------------------------------
let g:vim_current_word#highlight_delay = 500
let g:vim_current_word#highlight_current_word = 0
let g:vim_current_word#excluded_filetypes = ['markdown', 'fern']

" obcat/vim-sclow -------------------------------------------------------------
set updatetime=100
let g:sclow_sbar_text = '┃'
let g:sclow_hide_full_length = 1
let g:sclow_block_buftypes = ['terminal', 'prompt']

" preservim/vim-markdown ------------------------------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_borderless_table = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:markdown_recommended_style = 0

" bullets-vim/bullets.vim -----------------------------------------------------
let g:bullets_pad_right = 0
let g:bullets_outline_levels = []
let g:bullets_set_mappings = 0
let g:bullets_custom_mappings = [
  \ ['imap', '<CR>', '<Plug>(bullets-newline)'],
  \ ['nmap', 'o', '<Plug>(bullets-newline)'],
  \ ['imap', '<C-l>', '<Plug>(bullets-demote)'],
  \ ['imap', '<C-h>', '<Plug>(bullets-promote)'],
  \ ]

" voldikss/vim-floaterm -------------------------------------------------------
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_autoclose = 2
augroup vimrc_floaterm
  autocmd!
  autocmd QuitPre * FloatermKill!
augroup END

" fzf.vim  --------------------------------------------------------------------
" Modified RG command to direct path
function! FZGrep(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call FZGrep(<q-args>, <bang>0)

" Modified RG command to direct pattern and path
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case " .
  \   <q-args>, 1, {'dir': system('git -C '.expand('%:p:h').
  \   ' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)

" Modified FZFMru command to show preview
command! -bang -nargs=? FZFMru call fzf_mru#actions#mru(<q-args>,
    \{
      \'window': {'width': 0.9, 'height': 0.6},
      \'options': [
        \'--preview', 'bat --style=numbers --color=always {}',
        \'--preview-window', 'down:50%'
      \]
    \})

" luochen1990/rainbow ---------------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
      \'guifgs': ['orange', 'magenta', 'cyan'],
      \'ctermfgs': ['yellow', 'magenta', 'cyan'],
      \'guis': ['bold'],'cterms': ['bold']
      \}

" vim-denops/denops.vim -------------------------------------------------------
let g:denops_disable_version_check = 1

" i9wa4/vim-markdown-number-header --------------------------------------------
let g:mnh_header_level_shift = 1
function! UnNumberHeader()
  let g:mnh_header_level_shift = 99
  NumberHeader
  let g:mnh_header_level_shift = 1
endfunction

" -----------------------------------------------------------------------------
" General settings
" -----------------------------------------------------------------------------
set nobackup              " Not create backup file.
set noswapfile            " Not create swapfile.
set smartindent           " Use smart indent.
set fenc=utf-8            " Use UFT-8
set autoread              " Reload file automatically when editing file was modify.
set hidden                " Enable to open other file when editing buffer.
set clipboard=unnamedplus " Ebable allignment to clipboard.
set clipboard+=unnamed    " Reflect yank value to register.
set belloff=all           " Disable beep.
set timeoutlen=400        " Timeout time untill key input.
set updatetime=200        " Set update time for gitgutter sign updating
set signcolumn=yes        " Always show a sign column to show lsp signs
set mouse=a               " Enable mouse controls in nomal, visual, insert and command mode.
set autochdir             " Change Current Directory when open tab/buffer.

" -----------------------------------------------------------------------------
" File Tree View (netrw)
" -----------------------------------------------------------------------------
filetype plugin indent on     " Enable filetree-view (netrw)
filetype plugin on            " Enable plugin
set nocp                      " Disable 'compatible'
let g:netrw_preview      = 1  " Split preview window
let g:netrw_liststyle    = 3  " tree style
let g:netrw_keepdir      = 0  " Set current dir at tree opening
let g:netrw_banner       = 0  " Delete banner
let g:netrw_winsize      = 25 " Window size
let g:netrw_browse_split = 4  " Splitting size

" -----------------------------------------------------------------------------
" Auto commands
" -----------------------------------------------------------------------------
autocmd!
" to load .vimrc automaticaly when change it.
au BufWritePost *.vimrc source ~/.vimrc
" to save the last cursor position.
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" to save & restore current session
augroup session
function! SaveSess()
  execute 'mksession! ~/.session.vim'
endfunction
function! RestoreSess()
  if !empty(glob('~/.session.vim'))
      execute 'so ~/.session.vim'
  endif
endfunction
autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()
augroup END

" -----------------------------------------------------------------------------
" Custom Keybinds
" -----------------------------------------------------------------------------
" Enable jj key for exit insert mode.
inoremap <silent> jj <ESC>
vnoremap <silent> nn <ESC>

" Reload editor
nnoremap <silent> <F5> :e<CR>

" Enable direct cursor moving in wrapped line
nnoremap j gj
nnoremap k gk

" 1 line scrolling
nnoremap <S-k> <C-y>
nnoremap <S-j> <C-e>

" Toggle buffer
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-w> :bp<bar>sp<bar>bn<bar>bd<CR>

" Split window
nnoremap <silent> fu <C-w>s<C-w>j
nnoremap <silent> fi <C-w>v<C-w>l
" Close current window
nnoremap <silent> fx <C-w>c
" Change current window
nnoremap <silent> fh <C-w>h
nnoremap <silent> fj <C-w>j
nnoremap <silent> fk <C-w>k
nnoremap <silent> fl <C-w>l
" Move current window
nnoremap <silent> fH <C-w>H
nnoremap <silent> fJ <C-w>J
nnoremap <silent> fK <C-w>K
nnoremap <silent> fL <C-w>L
" Change current window size
nnoremap <silent> f. <C-w>>  " Move partition to right
nnoremap <silent> f, <C-w><  " Move partition to left
nnoremap <silent> f- <C-w>_  " Move partition to up
nnoremap <silent> f= <C-w>=  " Move partition to down
" Function to toggle window size between normal to max.
let g:toggle_window_size = 0
function! ToggleWindowSize()
  if g:toggle_window_size == 1
    exec "normal f="
    let g:toggle_window_size = 0
  else
    :resize
    :vertical resize
    let g:toggle_window_size = 1
  endif
endfunction
nnoremap <silent> fz :call ToggleWindowSize()<CR>

" Release hilight search strings when continuous input ESC.
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Fold/Open
vnoremap <silent> zf zf  " Create fold
nnoremap <silent> zD zD  " Delete all fold
nnoremap <silent> zk zc  " Close fold
nnoremap <silent> zj zo  " Open fold
nnoremap <silent> zJ zO  " Open all fold
nnoremap <silent> zh zm  " Collapse one fold in the page
nnoremap <silent> zH zM  " Collapse all fold in the page
nnoremap <silent> zl zr  " Open one fold in the page
nnoremap <silent> zL zR  " Open all fold in the page

" Search selected words
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" Toggle netrw
" noremap <silent><C-o> :call ToggleNetrw()<CR>

" -----------------------------------------------------------------------------
" Input settings
" -----------------------------------------------------------------------------
set whichwrap=b,s,h,l,<,>,[,]   " Cursol can move between line end to line head
set backspace=indent,eol,start  " Enable backspace.
set shiftwidth=2                " Change indent to space.
set wildmode=list:longest       " Complement file name when input command.
set textwidth=0                 " Disable auto indentation.

" -----------------------------------------------------------------------------
" Tab's number settings
" -----------------------------------------------------------------------------
set list listchars=tab:\?\-  " Tab are displayed as symbols.
set expandtab                " Modify tab to space.
set tabstop=2                " Set number of spacess (at line head).
set softtabstop=2            " Set number of spacess (at line head).
set shiftwidth=2             " Set number of tabs (inline).

" -----------------------------------------------------------------------------
" Search settings
" -----------------------------------------------------------------------------
set ignorecase  " Ignore case sensitivity when search strings is lower case.
set incsearch   " Enable live search.
set wrapscan    " Go file head when search is arrive at EOF
set hlsearch    " Hilight search strings.

" -----------------------------------------------------------------------------
" Appearance settings
" -----------------------------------------------------------------------------
set t_Co=256                           " Enable 256 colors.
set termguicolors                      " Enable termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set cursorline                         " Hilight current line.
set nowrap                             " Disable line wrap.
syntax enable                          " Enable syntax hilight.

" Transparent background
if !has('gui_running')
    augroup transparent
      autocmd VimEnter,ColorScheme * hi Normal guibg=NONE
      autocmd VimEnter,ColorScheme * hi LineNr guibg=NONE
      autocmd VimEnter,ColorScheme * hi VertSplit guibg=NONE
      autocmd VimEnter,ColorScheme * hi Special guibg=NONE
      autocmd VimEnter,ColorScheme * hi Identifier guibg=NONE
    augroup END
endif

" Status & command line
set showcmd
set cmdheight=1
set laststatus=2
set display=lastline
" Statusline for plain (without using plugin) vim
" set statusline=%{mode()}│%f\ %m│%R%<
" set statusline+=%=│%Y│%{&fileencoding}│row\ %L│

" Display line numbers.
set number

" Display fold column.
set foldcolumn=1

" Hilight pairs brackets.
set showmatch
set matchtime=1
set matchpairs& matchpairs+=<:>

" Display double quotation in json file.
set conceallevel=0
let g:vim_json_syntax_conceal = 0

" Display column limit '80'
" execute "set colorcolumn=" . join(range(81, 82), ',')
" highlight ColorColumn guibg=#333333 ctermbg=darkgray

" Cursor shaping
if has('vim_starting')
    " Use line type cursol on insert mode.
    let &t_SI .= "\e[6 q"
    " Use block type cursol on normal mode.
    let &t_EI .= "\e[2 q"
    " Use blink line cursol on replace mode.
    let &t_SR .= "\e[4 q"
endif

