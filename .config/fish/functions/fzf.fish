# fzf shell functions for fish
# Requires: fzf, fd (optional but recommended), bat (optional), exa (optional)

# ─── Core fzf options ───────────────────────────────────────────────────────

set -gx FZF_DEFAULT_OPTS "
  --height=50%
  --layout=reverse
  --border=rounded
  --info=inline
  --prompt='❯ '
  --pointer='▶'
  --marker='✓'
  --bind=ctrl-/:toggle-preview
  --bind=ctrl-a:select-all
  --bind=ctrl-d:deselect-all
"

# Use fd for faster file finding if available
if command -q fd
    set -gx FZF_DEFAULT_COMMAND '/usr/bin/fd --type f --hidden --follow --exclude .git'
    set -gx FZF_ALT_C_COMMAND   '/usr/bin/fd --type d --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND  "$FZF_DEFAULT_COMMAND"
end


# ─── File & directory navigation ────────────────────────────────────────────

# fzf file finder — opens selected file in $EDITOR
function ff --description 'Fuzzy-find a file and open it in $EDITOR'
    set -l file (
        fzf \
            --preview 'bat --style=numbers --color=always {} 2>/dev/null || cat {}' \
            --preview-window=right:60%:wrap \
            --prompt='file ❯ ' \
            $argv
    )
    if test -n "$file"
        $EDITOR "$file"
    end
end

# fzf directory jumper — cd into selected directory
function fd --description 'Fuzzy-find a directory and cd into it'
    # If fd (the tool) is installed, prefer it; otherwise fall back to find
    set -l cmd
    if command -q fdfind
        set cmd 'fdfind --type d --hidden --follow --exclude .git'
    else if command -q fd
        set cmd '/usr/bin/fd --type d --hidden --follow --exclude .git'
    else
        set cmd 'find . -type d -not -path "*/.git/*"'
    end

    set -l dir (
        eval $cmd 2>/dev/null \
        | fzf \
            --preview 'exa --tree --icons --level=2 {} 2>/dev/null || ls {}' \
            --preview-window=right:40% \
            --prompt='dir ❯ ' \
            $argv
    )
    if test -n "$dir"
        cd "$dir"
    end
end


# ─── Git ────────────────────────────────────────────────────────────────────

# fzf branch switcher
function fbr --description 'Fuzzy-find and checkout a git branch'
    git rev-parse --is-inside-work-tree >/dev/null 2>&1; or begin
        echo "Not in a git repo."
        return 1
    end

    set -l branch (
        git branch --all --sort=-committerdate \
        | grep -v HEAD \
        | sed 's/.* //' \
        | sed 's#remotes/[^/]*/##' \
        | sort -u \
        | fzf \
            --preview 'git log --oneline --color=always --graph -20 {}' \
            --preview-window=right:50% \
            --prompt='branch ❯ '
    )
    if test -n "$branch"
        git checkout "$branch"
    end
end

# fzf commit log browser — press Enter to show full diff, ctrl-y to copy hash
function flog --description 'Browse git log with fzf; Enter to inspect commit'
    git rev-parse --is-inside-work-tree >/dev/null 2>&1; or begin
        echo "Not in a git repo."
        return 1
    end

    git log --oneline --color=always $argv \
    | fzf \
        --ansi \
        --no-sort \
        --preview 'git show --color=always {1}' \
        --preview-window=right:60%:wrap \
        --prompt='commit ❯ ' \
        --bind 'ctrl-y:execute-silent(echo {1} | pbcopy)' \
    | awk '{print $1}' \
    | xargs -r git show
end

# fzf stash browser
function fstash --description 'Browse and apply a git stash'
    git rev-parse --is-inside-work-tree >/dev/null 2>&1; or begin
        echo "Not in a git repo."
        return 1
    end

    set -l stash (
        git stash list \
        | fzf \
            --preview 'git stash show -p {1} --color=always' \
            --preview-window=right:60%:wrap \
            --prompt='stash ❯ ' \
        | cut -d: -f1
    )
    if test -n "$stash"
        git stash pop "$stash"
    end
end


# ─── History ────────────────────────────────────────────────────────────────

# fzf history search — replaces ctrl-r with a richer picker
function fh --description 'Search shell history with fzf and run selected command'
    set -l cmd (
        builtin history \
        | fzf \
            --no-sort \
            --tac \
            --prompt='history ❯ ' \
            --query (commandline)
    )
    if test -n "$cmd"
        commandline -- "$cmd"
    end
end


# ─── Processes ──────────────────────────────────────────────────────────────

# fzf process killer
function fkill --description 'Fuzzy-find a process and kill it'
    set -l pid (
        ps -eo pid,user,%cpu,%mem,comm \
        | tail -n +2 \
        | fzf \
            --multi \
            --header 'PID   USER       %CPU %MEM COMMAND' \
            --prompt='kill ❯ ' \
        | awk '{print $1}'
    )
    if test -n "$pid"
        echo $pid | xargs kill -9
        echo "Killed: $pid"
    end
end


# ─── Environment & misc ─────────────────────────────────────────────────────

# fzf env var inspector
function fenv --description 'Fuzzy-search environment variables'
    env \
    | sort \
    | fzf \
        --preview 'echo {}' \
        --preview-window=down:3:wrap \
        --prompt='env ❯ '
end

# fzf man page browser
function fman --description 'Fuzzy-find and open a man page'
    set -l page (
        man -k . \
        | awk '{print $1}' \
        | sort -u \
        | fzf \
            --preview 'man {} 2>/dev/null | head -80' \
            --preview-window=right:50%:wrap \
            --prompt='man ❯ '
    )
    if test -n "$page"
        man "$page"
    end
end

# fzf ssh host picker (reads ~/.ssh/config)
function fssh --description 'Fuzzy-find an SSH host from ~/.ssh/config and connect'
    set -l host (
        grep -iE '^Host ' ~/.ssh/config 2>/dev/null \
        | awk '{print $2}' \
        | grep -v '\*' \
        | fzf \
            --prompt='ssh ❯ '
    )
    if test -n "$host"
        ssh "$host"
    end
end
