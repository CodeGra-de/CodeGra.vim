function! <SID>CGAPI(cmd, ...)
	let cmdstr = 'cgapi-consumer ' . a:cmd
	for arg in a:000
		let cmdstr .= ' ' . shellescape(arg)
	endfor

	return system(cmdstr)
endfunction

" Open the given file in a split of 10 lines
" below the current window.
function! <SID>OpenSplitBelow(filename) abort
	execute 'below split ' . a:filename
	resize 10
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=acwrite
	setlocal noswapfile
endfunction

function! <SID>FindFileFromRoot(path, filename) abort
	let parts = split(fnamemodify(a:path, ':p'), '/')

	for i in range(len(parts))
		let filepath = '/' . join(parts[:i] + [a:filename], '/')
		if filereadable(filepath)
			return filepath
		endif
	endfor

	return ''
endfunction

function! <SID>OpenCGFile(filename) abort
	let path = fnamemodify(expand('%'), ':p:h')
	let filepath = <SID>FindFileFromRoot(path, a:filename)
	execute 'split ' . filepath
endfunction

function! <SID>IsCGSubmission(buf)
	let cg_sub_id = <SID>FindFileFromRoot(bufname(a:buf), '.cg-submission-id')

	return len(cg_sub_id)
endfunction

function! <SID>FillQuickFixList(buf)
	let comments = values(<SID>GetLineFeedback(a:buf))
        call sort(comments, {a, b -> a['lnum'] - b['lnum']})

	call setqflist(comments)
	cwindow
endfunction

function! <SID>MakeComment(buf, lnum, text)
	return {
		\ 'bufnr': a:buf,
		\ 'lnum': a:lnum,
		\ 'col': 1,
		\ 'text': a:text,
	\ }
endfunction

function! <SID>GetLineFeedback(buf) abort
	let comments = getbufvar(a:buf, 'codegra_de_line_feedback', {})
	if !empty(comments) | return comments | endif

	if !<SID>IsCGSubmission(a:buf)
		throw 'This is not a CodeGra.de buffer!'
	endif

	let filepath = fnamemodify(bufname(a:buf), ':p')
	let json = <SID>CGAPI('get-comment', filepath)

	for comment in json#parse(json)
		let comment = <SID>MakeComment(a:buf, comment['line'], comment['content'])
		let comments[comment['lnum']] = comment
	endfor

	call setbufvar(a:buf, 'codegra_de_line_feedback', comments)
	return comments
endfunction

function! <SID>GetCommentAtLine(buf, lnum) abort
	let comments = <SID>GetLineFeedback(a:buf)

	return get(comments, a:lnum, {})
endfunction

function! <SID>InsertCommentAtLine(buf, lnum, text)
	let comments = <SID>GetLineFeedback(a:buf)

        if has_key(comments, a:lnum)
		let comments[a:lnum]['text'] = a:text
	else
        	let comments[a:lnum] = <SID>MakeComment(a:buf, a:lnum, a:text)
	endif

	" TODO: reload quickfix window
endfunction

" Set the content of the current buffer as the comment
" for the file in the given buffer at the given line.
function! <SID>SetCommentAtLine(buf, lnum)
	let file = bufname(a:buf)
	let text = join(getline(1, '$'), "\n")

	call <SID>CGAPI('set-comment', file, a:lnum, text)
	call <SID>InsertCommentAtLine(a:buf, a:lnum, text)

	setlocal nomodified
endfunction

function! <SID>DeleteCommentAtLine(buf, lnum)
	let comments = <SID>GetLineFeedback(a:buf)

	if has_key(comments, a:lnum)
		let file = bufname(a:buf)
		call <SID>CGAPI('delete-comment', file, a:lnum)
		call remove(comments, a:lnum)
	endif
endfunction

function! codegrade#show_line_feedback() abort
	let buf = bufnr('%')

	call <SID>FillQuickFixList(buf)
endfunction

function! codegrade#edit_line_feedback() abort
	let buf = bufnr('%')
	let lnum = line('.')
	let comment = <SID>GetCommentAtLine(buf, lnum)
	let text = get(comment, 'text', '')

	let temp = tempname()
	call <SID>OpenSplitBelow(temp)

	call append(0, split(text, "\n"))
	call setpos('.', [0, 0, 0])
	setlocal nomodified

	execute 'autocmd BufWriteCmd <buffer> call <SID>SetCommentAtLine(' . buf . ', ' . lnum . ')'
endfunction

function! codegrade#delete_line_feedback() abort
	let buf = bufnr('%')
	let lnum = line('.')

	call <SID>DeleteCommentAtLine(buf, lnum)
endfunction

function! codegrade#edit_feedback()
	call <SID>OpenCGFile('.cg-feedback')
endfunction

function! codegrade#edit_grade()
	call <SID>OpenCGFile('.cg-grade')
endfunction

function! codegrade#open_rubric_editor()
	call <SID>OpenCGFile('.cg-edit-rubric.md')
endfunction

function! codegrade#open_rubric_selector()
	call <SID>OpenCGFile('.cg-rubric.md')
endfunction
