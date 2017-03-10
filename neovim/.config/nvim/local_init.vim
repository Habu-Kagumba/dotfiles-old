" Python settings
let g:python_host_prog = '/Users/herbertkagumba/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/herbertkagumba/.pyenv/versions/neovim3/bin/python'

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" ELM
let g:elm_syntastic_show_warnings = 1
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0


nnoremap <leader>erepl  :ElmRepl<cr>
nnoremap <leader>err    :ElmErrorDetail<cr>
nnoremap <leader>edocs  :ElmShowDocs<cr>
vnoremap <leader>ebrw    :ElmBrowseDocs<cr>
vnoremap <leader>efmt   :ElmFormat<cr>

" Clean search (highlight)
nmap <silent> <BS> :nohlsearch<CR>

" Clipboard size
if has('persistent_undo')
	set undofile
endif

set undodir=$HOME/.VIM_UNDO_FILES

set undolevels=5000

" Matchpairs
set matchpairs+=<:>,=:;

" Paste
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>

" remap <ESC>
inoremap jk <Esc>

" remap completion
inoremap <leader>, <C-x><C-p>

" enable mouse scrolling
set mouse=a

" relativenumber
set rnu

" switch number style
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set nu
  else
    set rnu
    set nonu
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>

" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'go']

" re-indent whole file
map <F7> mzgg=G`z`

" Insert Mode as bpry<space>
iabbr bpry require'pry';binding.pry

" Add the pry debug line with ,bp
map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>
" Alias for one-handed operation:
map <Leader><Leader>p <Leader>bp

" Keep pry from annoyingly hanging around when using, e.g. pry-rescue/minitest
map <F9> :wa<cr>:call system('kill-pry-rescue')<cr>

" Nab lines from ~/.pry_history (respects "count")
nmap <Leader>ph :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.pry_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>
" ↑ thanks to Houl, ZyX-i, and paradigm of #vim for all dogpiling on this one.

" Resize
nnoremap <silent> <Leader>- :exe "vertical resize 100"<CR>

" Alphanumerics
"alphsubs ---------------------- {{{
        execute "digraphs ks " . 0x2096
        execute "digraphs as " . 0x2090
        execute "digraphs es " . 0x2091
        execute "digraphs hs " . 0x2095
        execute "digraphs is " . 0x1D62
        execute "digraphs ks " . 0x2096
        execute "digraphs ls " . 0x2097
        execute "digraphs ms " . 0x2098
        execute "digraphs ns " . 0x2099
        execute "digraphs os " . 0x2092
        execute "digraphs ps " . 0x209A
        execute "digraphs rs " . 0x1D63
        execute "digraphs ss " . 0x209B
        execute "digraphs ts " . 0x209C
        execute "digraphs us " . 0x1D64
        execute "digraphs vs " . 0x1D65
        execute "digraphs xs " . 0x2093
"}}}

" Important buffers stuff

" nnoremap <Leader>b :Buffers<cr>
noremap <Leader>e :FZF<cr>
" noremap <Leader>ge :GFiles<cr>
noremap \ <C-^><CR>
set path+=**
set wildmenu

" Fuzzy Search support
set rtp+=/usr/local/opt/fzf

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" " optiona YCM config
" " These are the tweaks I apply to YCM's config, you don't need them but they might help.
" " YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
" set completeopt-=preview
" let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_semantic_triggers = {
" 			\ 'elm' : ['.'],
" 			\}
nnoremap <silent> <F8> :!clear;gcc % -o % && ./%<CR>

" Syntastic quickfix window setting
let g:syntastic_loc_list_height=2

" add shebang info to files
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: iso-8859-15 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># encoding: UTF-8\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END

" Customise vim-rspec command
let g:rspec_command = "!clear; bundle exec rspec -c -f d {spec}"

" map <F6> to generate ctags
nnoremap <F6> :!ctags -R<cr>
" Automatically generate ctags on save.
" autocmd BufWritePost * call system("ctags -R")

" Scala
let g:scala_scaladoc_indent = 1
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>dt :EnTypeCheck<CR>
au FileType scala nnoremap <localleader>df :EnDeclarationSplit v<CR><Paste>
