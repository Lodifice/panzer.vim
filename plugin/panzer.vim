let g:panzers =
\[
\   [
\   '________________',
\   '|""""""""""""""|=======[]',
\   '|_______________\_____',
\   '|==+==================\',
\   '|______________________|',
\   '\(@)(@)(@)(@)(@)(@)(@)/',
\   ' ^^^^^^^^^^^^^^^^^^^^^'
\   ],
\   [
\   '   _          _          _          _          _          _',
\   ' _[_]===    _[_]===    _[_]===    _[_]===    _[_]===    _[_]===',
\   '(_____)    (_____)    (_____)    (_____)    (_____)    (_____)'
\   ],
\   [
\   '   [ O ]',
\   '     \ \      p',
\   '      \ \  \o/',
\   '       \ \--"---_',
\   '       /\ \   / ~~\_',
\   ' ./---/__|=/_/------//~~~\',
\   '/___________________/O   O \',
\   '(===(\_________(===(Oo o o O)',
\   ' \~~~\____/     \---\Oo__o--',
\   '   ~~~~~~~       ~~~~~~~~~~'
\   ]
\] 

let g:panzer_frames = {'vim': {'roofleft': '"', 'roofright': '"', 'center': '-', 'pillar': '"', 'baseleft': '"', 'baseright': '"'},
                      \'c': {'roofleft': '/*', 'roofright': '*\', 'center': '*', 'pillar': '|*|', 'baseleft': '\*', 'baseright': '*/'},
                      \'default': {'roofleft': '#', 'roofright': '#', 'center': '#', 'pillar': '#', 'baseleft': '#', 'baseright': '#'}
                      \}

function! Panzer(i)
    let max_length = 0
    for j in g:panzers[a:i]
        let cl = strlen(j)
        if cl > max_length
            let max_length = cl
        endif
    endfor
    let frames = get(g:panzer_frames, &filetype, g:panzer_frames['default'])
    let max_length += 2 * strlen(frames['pillar'])
    let dirty = frames['roofleft']
    let rest = max_length - strlen(dirty) - strlen(frames['roofright']) + 2 * strlen(' ')
    while rest > 0
        let dirty .= frames['center']
        let rest -= strlen(frames['center'])
    endwhile
    let dirty .= frames['roofright']
    put =dirty
    for j in g:panzers[a:i]
        let foo = frames['pillar'] . " "
        let rest = max_length - 2 * strlen(frames['pillar'])
        let foo .= j
        let rest -= strlen(j)
        while rest > 0
            let foo .= ' '
            let rest -= strlen(' ')
        endwhile
        let foo .= " " . frames['pillar']
        put =foo
    endfor
    let ditry = frames['baseleft']
    let rest = max_length - strlen(ditry) - strlen(frames['baseright']) + 2 * strlen(' ')
    while rest > 0
        let ditry .= frames['center']
        let rest -= strlen(frames['center'])
    endwhile
    let ditry .= frames['baseright']
    put =ditry
endfunction

command! Panzer :execute "call Panzer(localtime() % len(g:panzers))"
