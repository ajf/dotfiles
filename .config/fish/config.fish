set theme_color_scheme solarized-dark

fish_vi_key_bindings

fish_add_path ~/bin
fish_add_path ~/.cargo/bin

# fish_ssh_agent

if type -q zoxide
  zoxide init fish | source
else
  echo "WARNING: no zoxide installed"
end

if type -q rustup
  rustup completions fish | source
else
  echo "WARNING: no rustup installed"
end

if type -q direnv
  direnv hook fish | source
else
  echo "WARNING: no direnv installed"
end

if type -q nvim
  set -xg EDITOR nvim
else
  echo "WARNING: No Neovim installed"
end


set -g theme_display_date no
set -g theme_display_hg no
set -g theme_display_virtualenv no
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node no
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace yes
set -g theme_color_scheme solarized-dark
