function ra --wraps=ranger --description 'alias ra=ranger'
    if test $ZELLIJ
        ranger -r $HOME/.config/ranger/ranger_nopreview $argv
    else
        ranger -r $HOME/.config/ranger/ranger $argv
    end
end
