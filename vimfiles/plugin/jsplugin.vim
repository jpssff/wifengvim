if exists("b:did_jsplugin")
    finish
endif

let b:did_jsplugin = 1
let s:js_dir = expand("$vim/vimfiles/jsplugin")
let s:cmd = ""

function s:js()
    if has("win32")
        let s:cmd = 'cscript /NoLogo '
    else
        if exists("$JS_CMD")
            let s:cmd = "$JS_CMD"
        elseif executable('/System/Library/Frameworks/JavaScriptCore.framework/Resources/jsc')
            let s:cmd = '/System/Library/Frameworks/JavaScriptCore.framework/Resources/jsc'
        elseif executable('node')
            let s:cmd = 'node'
        elseif executable('js')
            let s:cmd = 'js'
        else
            "echoerr('No JS interpreter found. Checked for jsc, js (spidermonkey), and node')
        endif
    endif
    return s:cmd
endfunction

call s:js()

function! g:ExecJS(name, input)
    let s:res = system(s:cmd . ' ' . shellescape(s:js_dir) . '/run.wsf', a:name . '|' . a:input)
    let s:i = stridx(s:res, '|')
    let s:method = strpart(s:res, 0, s:i)
    let s:text = strpart(s:res, s:i+1)
    if s:method == 'echo'
        echo s:text
    elseif s:method == 'echoerr'
        echoerr s:text
    elseif s:method == 'replace'
        normal ggdG
        call setline(1, split(s:text, "\n", 1))
    endif
endfunction

map \jf :call g:ExecJS('format_js', join(getline(1, '$'), "\n"))<CR>

"echo s:js_dir
