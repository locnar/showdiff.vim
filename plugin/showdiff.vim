function! ShowDiffs(...)
  enew
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile

  let argc = a:0

  if(argc == 0)
    let directory = ""
  else
    let directory = a:1
  endif

  if(directory == "")
    let path = system("pwd")
    " echom "PATH: " . path

    let directory = substitute(path, "/cpp.*$", "", "") . "/cpp"
    " echom "BASE: " . directory
  endif

  let command = ".!svn diff " . directory
  " echom "COMMAND: " . command

  execute command

  setlocal readonly
  setlocal nomodifiable
  setlocal nospell

  set filetype=diff
endfunction

comm! -nargs=? -bang SD call ShowDiffs(<f-args>)

