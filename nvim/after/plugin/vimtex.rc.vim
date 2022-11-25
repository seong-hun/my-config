syntax enable

" let g:vimtex_view_method = 'sioyek'
" let g:vimtex_view_sioyek_exe = '/Applications/sioyek.app/Contents/MacOS/sioyek'
" let g:vimtex_callback_progpath ='/usr/local/bin/nvim'
let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'
let g:vimtex_view_skim_sync = 0
let g:vimtex_view_skim_activate = 0
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_complete_img_use_tail = 1
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1  " for performance

augroup latexSurround
	 autocmd!
	 autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
	 let b:surround_{char2nr("e")}
		 \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
	 let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction

au BufNewFile,BufRead *.tex,*.bib call SetTexOptions()
function SetTexOptions()
	" setl tabstop=2
	" setl softtabstop=2
	" setl shiftwidth=2
	" setl linebreak
	" setl showbreak=...
	" setl colorcolumn=80
	setl spell
	" setl tw=79
	" setl cole=0
	" " noremap  <buffer> <silent> <Up>   gk
	" " noremap  <buffer> <silent> <Down> gj
	" setl wrap lbr
	" noremap j gj
	" noremap k gk
endfunction
