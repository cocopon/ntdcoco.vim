let s:save_cpo = &cpoptions
set cpoptions&vim


function! s:parse(colorcolumn) abort
	return split(a:colorcolumn, ',')
endfunction


function! s:get_cursor_column() abort
	let concealed_count = 0

	for col in range(0, col('.') - 1)
		if synconcealed('.', col)[0]
			let concealed_count += 1
		endif
	endfor

	let cur_col = getcurpos()[4]
	return cur_col - concealed_count
endfunction


function! s:stringify(columns) abort
	let cols = uniq(sort(copy(a:columns)))
	return join(cols, ',')
endfunction


function! ntdcoco#clear() abort
	let &cc = ''
endfunction


function! ntdcoco#toggle(col) abort
	let cols = s:parse(&cc)
	let col = printf('%d', a:col)

	let contains = (index(cols, col) >= 0)
	if contains
		call filter(cols, 'v:val !=# col')
	else
		call add(cols, col)
	endif

	let &cc = s:stringify(cols)
endfunction


function! ntdcoco#toggle_cursor() abort
	let col = s:get_cursor_column()
	call ntdcoco#toggle(col)
endfunction


let &cpoptions = s:save_cpo
