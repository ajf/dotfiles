function ls --wraps=exa --description 'ls replacement using exa'
    # Check if exa is available, fall back to regular ls if not
    if not command -q exa
        command ls $argv
        return
    end

    # If no arguments given, use a sensible default view
    if test (count $argv) -eq 0
        exa \
            --all \
            --long \
            --group \
            --header \
            --git \
            --icons \
            --group-directories-first \
            --time-style=long-iso \
            --color=always
    else
        exa \
            --all \
            --long \
            --group \
            --header \
            --git \
            --icons \
            --group-directories-first \
            --time-style=long-iso \
            --color=always \
            $argv
    end
end

# Convenience aliases
function ll --wraps=exa --description 'List with details'
    ls $argv
end

function la --wraps=exa --description 'List all including hidden'
    exa --all --icons --group-directories-first --color=always $argv
end

function lt --wraps=exa --description 'List as a tree'
    exa --tree --icons --git-ignore --color=always $argv
end

function lsize --wraps=exa --description 'List sorted by size'
    exa --all --long --sort=size --reverse --icons --color=always $argv
end

function lnew --wraps=exa --description 'List sorted by modified time, newest first'
    exa --all --long --sort=modified --reverse --icons --color=always $argv
end
