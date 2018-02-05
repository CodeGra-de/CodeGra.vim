if exists("g:loaded_CodeGra_vim") || v:version < 703 || &compatible
    finish
endif
let g:loaded_CodeGra_vim = 1

let s:save_cpo = &cpo
set cpo&vim

command! CGShowLineFeedback call codegrade#show_line_feedback()
command! CGEditLineFeedback call codegrade#edit_line_feedback()
command! CGDeleteLineFeedback call codegrade#delete_line_feedback()

let &cpo = s:save_cpo
