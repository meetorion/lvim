require('competitest').setup {
    compile_command = {
        cpp = { exec = 'g++', args = { '$(FNAME)', '-o', '$(FNOEXT)' } },
        -- go  = { exec = 'go build', args = { '$(FNAME)', '-o', '$(FNOEXT)' } },
        -- go  = { exec = 'go build', args = { '$(FNAME)' } },
    },
    run_command = {
        cpp = { exec = './$(FNOEXT)' },
        go  = { exec = 'go run $(FNAME)' },
        -- go  = { exec = 'go run $()' },
        -- go  = { exec = 'go run %', },
    },
}
