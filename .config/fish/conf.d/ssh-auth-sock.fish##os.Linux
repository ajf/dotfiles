# vim:filetype=fish

# Expect the ssh sock authentication to the systemctl managed thing.
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

if ! test -S $SSH_AUTH_SOCK
	echo "No SSH auth socket found @ $SSH_AUTH_SOCK, is systemd running the ssh-agent user unit?"
end
