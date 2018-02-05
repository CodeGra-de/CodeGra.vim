if exists("g:loaded_CodeGra_vim") || v:version < 703 || &compatible
    finish
endif
let g:loaded_CodeGra_vim = 1

let s:save_cpo = &cpo
set cpo&vim

command! CGShowLineFeedback call codegra#show_line_feedback()
command! CGEditLineFeedback call codegra#edit_line_feedback()

let &cpo = s:save_cpo
