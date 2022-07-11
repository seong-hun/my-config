function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif

	set linebreak
	set conceallevel=2

	noremap <silent> k gk
	noremap <silent> j gj
	noremap <silent> 0 g0
	noremap <silent> $ g$
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif

	set nolinebreak
	set conceallevel=0

	nunmap <silent> k
	nunmap <silent> j
	nunmap <silent> 0
	nunmap <silent> $
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
