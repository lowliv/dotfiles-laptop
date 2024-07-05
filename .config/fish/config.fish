if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
    set fish_greeting
    set -gx EDITOR helix
    set -gx VISUAL helix
    fish_add_path -v ~/applications
end
