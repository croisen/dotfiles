let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '|'

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['hunks', '%f'])
    let g:airline_section_c = airline#section#create([''])
    let g:airline_section_x = airline#section#create(['filetype'])
    let g:airline_section_y = airline#section#create(['ffenc'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction

autocmd VimEnter * call AirlineInit()
