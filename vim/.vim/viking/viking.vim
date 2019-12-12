" *****************************************************************
" command used to auto check file type
function CheckFileType()
    if exists("b:countCheck") == 0
	let b:countCheck = 0
    endif
    
    let b:countCheck += 1

    if &filetype == "" && b:countCheck>20 && b:countCheck<200
	filetype detect
    elseif &filetype != "" || b:countCheck>200
	autocmd! newFileDectection
    endif
endfunction


augroup newFileDectection
    autocmd CursorMovedI * call CheckFileType()
augroup END 
" *****************************************************************



" *****************************************************************
""" command used to udpate laste modify mark in file 
"autocmd BufWritePre,FileWritePre *.h,*.c  mark s | call LastMod() | `s
autocmd BufWritePre,FileWritePre * call LastMod()
function LastMod()
    " save current cursor position
    let curPos = getpos(".")

    let maxLine = line("$")
    if maxLine > 45
	let maxLine = 45
    endif

    exec " 1," . maxLine . "g/Last modified/s/Last modified:.*/Last modified: " . strftime("%Y-%m-%d %k:%M") . "/e"

    " restore cursor position
    call setpos(".", curPos)
endfunction
" *****************************************************************



" *****************************************************************
" below are function used to sort lines accoring to they length
function! s:MyCmp(s1,s2) range
    return strlen(a:s1)-strlen(a:s2)
endfunction

function! s:SortByLength() range
    let line_start = line("'<")
    let line_end = line("'>")

    echo line_start . "\t" . line_end

    let l=map(range(line_start,line_end),"getline(v:val)")

    call sort(l,"s:MyCmp")
    for i in range(line_start,line_end)
	call setline(i,l[i-line_start])
    endfor
endfunction

command! -range=% Sort call s:SortByLength()
" *****************************************************************
