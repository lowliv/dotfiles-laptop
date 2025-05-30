if status is-interactive
    # Commands to run in interactive sessions can go here
    nitch
    set fish_greeting
    set -gx EDITOR helix
    set -gx VISUAL helix
    set -gx XDG_DOCUMENTS_DIR "$HOME/documents"
    set -gx XDG_DOWNLOAD_DIR "$HOME/downloads"
    set -gx XDG_MUSIC_DIR "$HOME/media/music"
    set -gx XDG_PICTURES_DIR "$HOME/media/pictures"
    set -gx XDG_VIDEOS_DIR "$HOME/media/videos"
    set -gx SDL_VIDEODRVIER wayland "$HOME/bin/osu.AppImage"
    set -gx XDG_SESSION_TYPE wayland
    if not contains $HOME/bin $PATH
        fish_add_path -v $HOME/bin
    end
end
