if status is-interactive
    # Commands to run in interactive sessions can go here
    nitch
    set fish_greeting
    set -gx EDITOR helix
    set -gx VISUAL helix
    set -gx XDG_DESKTOP_DIR "$HOME/desktop"
    set -gx XDG_DOCUMENTS_DIR "$HOME/documents"
    set -gx XDG_DOWNLOAD_DIR "$HOME/downloads"
    set -gx XDG_MUSIC_DIR "$HOME/music"
    set -gx XDG_PICTURES_DIR "$HOME/pictures"
    set -gx XDG_PUBLICSHARE_DIR "$HOME/public"
    set -gx XDG_TEMPLATES_DIR "$HOME/templates"
    set -gx XDG_VIDEOS_DIR "$HOME/videos"
    set -gx SDL_VIDEODRVIER wayland "$HOME/applications/osu.AppImage"
    set -gx XDG_SESSION_TYPE x11 ./AdvandedDockingSystemDemo
    fish_add_path -v $HOME/bin
end
