" Vim support file to detect file types in scripts
"
" first line check
let s:first_line = getline(1)

"       Mikrotik RouterOS script
if      s:first_line =~ "^#.* by RouterOS.*"
        setfiletype rsc
endif

unlet s:first_line
