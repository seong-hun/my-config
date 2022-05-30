augroup latexSurround
	 autocmd!
	 autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
	 let b:surround_{char2nr("e")}
		 \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
	 let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction

let g:vimtex_view_method = 'skim'
let g:vimtex_complete_img_use_tail = 1
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1  " for performance
