function! neoformat#formatters#php#enabled() abort
    return ['phpcsfixer']
endfunction

function! neoformat#formatters#php#phpcsfixer() abort
    return {
          \'exe': 'php-cs-fixer',
          \'args': ['fix', '-q'],
          \'replace': 1,
          \}
endfunction

