let s:save_cpo = &cpoptions
set cpoptions&vim


if exists('g:loaded_ntdcoco')
  finish
endif
let g:loaded_ntdcoco = 1


nnoremap <silent> <Plug>(ntdcoco-clear) :<C-u>call ntdcoco#clear()<CR>
nnoremap <silent> <Plug>(ntdcoco-toggle-cursor) :<C-u>call ntdcoco#toggle_cursor()<CR>


let &cpoptions = s:save_cpo
