function Get_single_selection(list)
    let selection = fzf#run(#{source: a:list})
    return selection[0]
endfunction

function Get_repo_list()
    return systemlist('ls '.g:repos_dir)
endfunction

function Navigate_to(path)
    try
        execute 'cd '.a:path
        echo 'navigated to '.getcwd()
    catch
        echo 'could not navigate to '.a:path
    endtry
endfunction

function Get_git_dirs()
    return systemlist('git ls-files | xargs -n 1 dirname | sort | uniq')
endfunction
function Choose_repo_dir()
    let repo_selection = Get_single_selection(Get_repo_list())
    let _ = Navigate_to(g:repos_dir.'/'.repo_selection)
endfunction

command! -nargs=? Dir :call Dir(<f-args>)
function Dir(...)
    if (exists("a:1"))
        let _ = Navigate_to(a:1)
    else
        let selection = Get_single_selection(Get_git_dirs())
        let _ = Navigate_to(selection)
    endif
endfunction

command! -nargs=? OpenInRanger :call OpenInRanger(<f-args>)
function OpenInRanger(...)
    if (exists("a:1"))
        let path = a:1
    else
        let path = '%'
    endif
    call OpenRangerIn(path, 'edit ')
endfunction
