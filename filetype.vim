" -----------------------------------------------------------------------------
" Filedetect stuff
" -----------------------------------------------------------------------------
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
	au! BufRead,BufNewFile *.vm,*.velocity setfiletype velocity
augroup END

