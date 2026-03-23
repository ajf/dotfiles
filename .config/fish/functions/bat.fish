function cat --wraps=bat --description 'cat replacement using bat'
    if not command -q bat
        command cat $argv
        return
    end

    # If stdin is being piped in (not a TTY), pass through cleanly
    if not isatty stdin
        bat --plain --paging=never $argv
        return
    end

    # No arguments — mimic cat's behaviour (read from stdin)
    if test (count $argv) -eq 0
        bat --plain --paging=never
        return
    end

    bat \
        --style=numbers,changes,header \
        --paging=never \
        --color=always \
        --decorations=always \
        --wrap=auto \
        $argv
end


# ─── Convenience variants ────────────────────────────────────────────────────

# Minimal output — no line numbers, no header, no git diff markers
function catp --wraps=bat --description 'bat: plain output, no decorations'
    bat --plain --paging=never --color=always $argv
end

# Paged output for long files (like less, but with syntax highlighting)
function batp --wraps=bat --description 'bat: paged with syntax highlighting'
    bat \
        --style=numbers,changes,header \
        --paging=always \
        --color=always \
        $argv
end

# Print only a specific line range — useful for inspecting large files
function catn --wraps=bat --description 'bat: print specific lines  (usage: catn FILE 10 20)'
    if test (count $argv) -lt 3
        echo "Usage: catn <file> <start> <end>"
        return 1
    end
    bat \
        --plain \
        --paging=never \
        --color=always \
        --line-range=$argv[2]:$argv[3] \
        $argv[1]
end

# Syntax-highlight a snippet passed via stdin, specifying language explicitly
# Usage: echo '{"a":1}' | catl json
function catl --wraps=bat --description 'bat: highlight stdin with explicit language'
    if test (count $argv) -lt 1
        echo "Usage: <cmd> | catl <language>"
        return 1
    end
    bat \
        --plain \
        --paging=never \
        --color=always \
        --language=$argv[1] \
        -
end

# Diff two files side-by-side with syntax highlighting
function batdiff --wraps=bat --description 'bat: highlighted diff of two files'
    if test (count $argv) -lt 2
        echo "Usage: batdiff <file1> <file2>"
        return 1
    end
    diff -u $argv[1] $argv[2] | bat --plain --paging=never --language=diff
end
