function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color green)(prompt_pwd)' '

    set_color -o
    if fish_is_root_user
        echo -n (set_color blue)'# '
    end

    echo -n (set_color blue)'❯'(set_color magenta)'❯'(set_color red)'❯ '
    set_color normal
end
