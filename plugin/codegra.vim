if exists("g:loaded_CodeGra_vim") || v:version < 703 || &compatible
    finish
endif
let g:loaded_CodeGra_vim = 1

let s:save_cpo = &cpo
set cpo&vim

command! CGEditFeedback call codegrade#open_cg_file('.cg-feedback')
command! CGEditGrade call codegrade#open_cg_file('.cg-grade')

command! CGShowLineFeedback call codegrade#line_feedback#show()
command! CGEditLineFeedback call codegrade#line_feedback#edit()
command! CGDeleteLineFeedback call codegrade#line_feedback#delete()

command! CGOpenRubricEditor call codegrade#open_cg_file('.cg-edit-rubric.md')
command! CGOpenRubricSelector call codegrade#open_cg_file('.cg-rubric.md')

command! CGRubricNextSection call codegrade#rubric#next_section('down', v:count1)
command! CGRubricPrevSection call codegrade#rubric#next_section('up', v:count1)
command! CGRubricNextItem call codegrade#rubric#next_item('down', v:count1)
command! CGRubricPrevItem call codegrade#rubric#next_item('up', v:count1)
command! CGRubricSelectItem call codegrade#rubric#select_item()

augroup codegra_de_filetypes
	autocmd!
	autocmd BufRead,BufNewFile .cg-feedback setfiletype cg-feedback
	autocmd BufRead,BufNewFile .cg-grade setfiletype cg-grade
	autocmd BufRead,BufNewFile .cg-rubric.md setfiletype cg-rubric
augroup END

let &cpo = s:save_cpo
