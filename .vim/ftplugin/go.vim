" ftplugin vim go 

" go test the test named under cursor
:command! -nargs=* Gt w|!go test -test.v -test.run=<cword> <args>
" go test all tests
:command! Gta w|!go test -test.v
" run the current file, passing through any args
:command! -nargs=* Gr w|!go run % <args>
" format this file
:command! Gf w|!go fmt %
let g:go_highlight_types = 1

