if exists("g:loaded_CodeGra_vim") || v:version < 703 || &compatible
    finish
endif
let g:loaded_CodeGra_vim = 1

let s:save_cpo = &cpo
set cpo&vim

command! CGShowLineFeedback call codegrade#show_line_feedback()
command! CGEditLineFeedback call codegrade#edit_line_feedback()
command! CGDeleteLineFeedback call codegrade#delete_line_feedback()

command! CGEditFeedback call codegrade#edit_feedback()
command! CGEditGrade call codegrade#edit_grade()

command! CGOpenRubricEditor call codegrade#open_rubric_editor()
command! CGOpenRubricSelector call codegrade#open_rubric_selector()

let &cpo = s:save_cpo
