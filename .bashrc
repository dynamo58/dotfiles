#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias code='vscodium'
alias siuuuuu='sudo pacman -Syyu; yay -Syyu'
alias run_twitch_bot='cd ~/programming/twitch-bot; clear; cargo run'
alias reload_font_cache='fc-cache -f -v'
alias t='tmux new -A -s main'


PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"


# wrapper for the `find` command
f() {
    dir=$1
    shift
    phrase=$@
    find ${dir} -name "${phrase}"
}

# clean up files
cleanup() {
    rm -rf ~/.local/share/Trash/*
}

# a small info about resources taken up by a process (by name)
# example: sysuse firefox
sysuse() {
    ps -p $(pgrep $1) -o %cpu,%mem,cmd
}

# wrapper for yt-dlp audio extraction
# example: ytmp3 <link>
ytmp3() {
    yt-dlp $1 --extract-audio --audio-format mp3
}

# wrapper to use mpv as a music player
# example: mpv-music ./my-awesome-playlist
#  source: https://www.reddit.com/r/mpv/comments/kf4zdq/comment/gg6fyc4/?utm_source=share&utm_medium=web2x&context=3
mpv-music() {
    mpv --vo=null --video=no --no-video --term-osd-bar --no-resume-playback --shuffle $1
}

# Append stuff to PATH
export PATH="$HOME/scripts:$PATH"

# external context
. "$HOME/.cargo/env"
