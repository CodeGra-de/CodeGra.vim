" From https://github.com/tpope/vim-rhubarb
function! json#parse(string) abort
	if exists('*json_decode')
		return json_decode(a:string)
	endif
	let [null, false, true] = ['', 0, 1]
	let stripped = substitute(a:string,'\C"\(\\.\|[^"\\]\)*"','','g')
	if stripped !~# "[^,:{}\\[\\]0-9.\\-+Eaeflnr-u \n\r\t]"
		try
			return eval(substitute(a:string,"[\r\n]"," ",'g'))
		catch
		endtry
	endif
	call s:throw("invalid JSON: ".a:string)
endfunction
