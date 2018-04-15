" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_quiet_messages={'level': 'warnings'}
let g:syntastic_check_on_wq= 0
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END
