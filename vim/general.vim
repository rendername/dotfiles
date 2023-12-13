command! -nargs=0 Nums :call Nums()
function Nums()
    if &number == 1
        let &number = 0
    else
        let &number = 1
    endif
    let &relativenumber = &number
endfunction
