if status is-interactive
    # Commands to run in interactive sessions can go here

    set fish_greeting

    starship init fish | source
    COMPLETE=fish jj | source

    # nvm
    if test -x /opt/homebrew/opt/nvm/nvm.sh
        bass source /opt/homebrew/opt/nvm/nvm.sh
    end

    # Abbreviations
    abbr --add dotdot --regex '^\.\.+$' --function multicd

    abbr --add -- jw 'watch -ctn 1 "jj --color always | tail -n 55"'
end
