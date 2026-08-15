
# ---------------------------------------------------------------------------- #
#                                     Alias                                    #
# ---------------------------------------------------------------------------- #
# ------------------------------- Suffix alias ------------------------------- #
alias -s py='code'
alias -s md='code'
alias -s json='code'

alias -s png='open'
alias -s mov='open'
alias -s mp4='open'

# ------------------------------- Global alias ------------------------------- #
alias -g C='| xclip -selection clipboard'
alias -g L='| less'
alias -g G='| grep'

# ----------------------------------- Alias ---------------------------------- #
alias fd='fdfind'
alias video_list='for d in /sys/class/video4linux/*; do echo "$(basename "$d"): $(cat "$d/name")"; done'
alias start_queue='tmux new-session -d -s queue 2>/dev/null; tmux send-keys -t queue "/home/ap/cloud/master/aris_master/.venv/bin/python3 /home/ap/cloud/master/aris_master/scripts/queue_manager.py" C-m; tmux attach-session -t queue'
alias img_res='identify -format "%wx%h\n"'
alias cron_log='journalctl -t CRON | grep "($USER)" | tail'
alias zrc='code ~/.zshrc'
unalias obsidian 2>/dev/null
alias todo='bash  ~/Documents/obsidian/Ubuntu/.obsidian/custom_scripts/search-todos.sh'
# ---------------------------------------------------------------------------- #
#                                   Functions                                  #
# ---------------------------------------------------------------------------- #
pipe_cp() {
  local dest="$1"
  [ -z "$dest" ] && { echo "usage: pipe_cp /path/to/destination"; return 1; }
  mkdir -p -- "$dest" || return 1
  while IFS= read -r file; do
    cp -- "$file" "$dest"/
  done
}
pipe_mv() {
  local dest="$1"
  [ -z "$dest" ] && { echo "usage: pipe_mv /path/to/destination"; return 1; }
  mkdir -p -- "$dest" || return 1
  while IFS= read -r file; do
    [ -z "$file" ] && continue
    mv -- "$file" "$dest"/ || echo "failed: $file" >&2
  done
}

# ---------------------------------------------------------------------------- #
#                                   Keybinds                                   #
# ---------------------------------------------------------------------------- #
# Copy current terminal command
copy-command() {
    print -rn -- "$BUFFER" | xclip -selection clipboard
    zle -M "Copied to clipboard"
}
zle -N copy-command
bindkey '^Xc' copy-command # Ctrl + X, (let go of ctrl, then:) C

# git commit key bind
bindkey -s '^Xgc' $'git commit -m ""\C-b' # Ctrl + X, (let go of ctrl, then:) G, C

