function! <SID>FindString(direction, count, string) abort
	let ws_old = &wrapscan
	set nowrapscan

	let col = col('.')

	silent! execute (a:direction == 'up' ? '?' : '/') . a:string

	if a:count > 1
		let times = a:direction == 'up' && col != 1 ? a:count : a:count - 1
		silent! execute 'normal! ' . repeat('n', times)
	endif

	let &wrapscan = ws_old
endfunction

function! codegrade#rubric#next_section(direction, count) abort
	call <SID>FindString(a:direction, a:count, '^##')
endfunction

function! codegrade#rubric#next_item(direction, count) abort
	call <SID>FindString(a:direction, a:count, '^- \[[ x]\]')
endfunction

function! codegrade#rubric#select_item() abort
	let line = line('.')
	let text = getline('.')

	if match(text, '^- \[x\] ') > -1
		return
	endif

	if match(text, '^- \[ \] ') == -1
		echohl ErrorMsg
		echo 'This is not a valid rubric item!'
		echohl Normal
		return
	endif

	execute "normal vip\<Esc>"
	silent! '<,'>s/^- \[\zsx\ze\]/ /

	call setline(line, text[:2] . 'x' . text[4:])
	call setpos('.', ['%', line, 0, 0])
endfunction
