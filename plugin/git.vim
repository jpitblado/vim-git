" git.vim -- Git control system mappings
" Maintainer:	Jeff Pitblado <jpitblado@stata.com>
" Last Change:	12may2015
" Version:	1.0.2

if exists("g:loaded_git_vim")
  finish
endif
let g:loaded_git_vim = 1

if !exists("g:git_command")
	let g:git_command = "git"
endif

" maps ----------------------------------------------------------------------

nnoremap <leader>gd :call git#diff("", bufname("%"))<cr>
nnoremap <leader>gD :call git#diff("", ".")<cr>
nnoremap <leader>ge :call git#diff("--cached", bufname("%"))<cr>
nnoremap <leader>gE :call git#diff("--cached", ".")<cr>

nnoremap <leader>gs :call git#status()<cr>

nnoremap <leader>ga :!git add %<cr>
nnoremap <leader>gc :!git commit %<cr>

" end: git.vim
