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

function! codegrade#open_cg_file(filename) abort
	let path = fnamemodify(expand('%'), ':p:h')
	let filepath = <SID>FindFileFromRoot(path, a:filename)
	execute 'split ' . filepath
endfunction

function! codegrade#is_cg_submission(buf) abort
	let filepath = <SID>FindFileFromRoot(bufname(a:buf), '.cg-submission-id')
	return len(filepath) > 0
endfunction
