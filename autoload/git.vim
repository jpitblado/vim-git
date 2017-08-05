" git.vim -- Git control system mappings
" Maintainer:	Jeff Pitblado <jpitblado@stata.com>
" Last Change:	25aug2014
" Version:	1.0.0

if exists("g:autoloaded_git_vim")
  finish
endif
let g:autoloaded_git_vim = 1

if !exists("g:git_command")
	let g:git_command = "git"
endif

" functions -----------------------------------------------------------------

" git#diff() -- Calls -git diff- and dumps the contents into a buffer named
" __diff_output__.

function! git#diff (rev, file)
	let output = system(g:git_command . " diff " . " " . a:rev . " " . a:file)
	if v:shell_error
		let output = bufname("%") . " NOT UNDER VERSION CONTROL"
	endif

	" open/setup a new split
	if bufwinnr("__diff_output__") == -1
		split __diff_output__
	else
		sbuffer __diff_output__
	endif

	normal! ggdG
	setlocal filetype=diff
	setlocal buftype=nofile

	" insert diff output
	call append(0, split(output, '\v\n'))
	normal! gg
endfunction

" git#status() -- Calls -git status- and dumps the contents into the current
" buffer.

function! git#status ()
	let output = system(g:git_command . " status --short")
	if v:shell_error
		let output = bufname("%") . " NOT UNDER VERSION CONTROL"
	endif

	" insert diff output
	call append(line("."), split(output, '\v\n'))
endfunction

" end: git.vim
