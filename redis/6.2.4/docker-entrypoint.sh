#!/bin/sh
# set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
	set -- redis-server "$@"
fi

# allow the container to be started with `--user`
# shellcheck disable=SC2166
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	find . \! -user redis -exec chown redis '{}' +
	exec gosu redis "$0" "$@"
fi
temp_redis_server_start() {
    echo Waiting for temp server startup
    nohup "$@" &
    # shellcheck disable=SC2039
    local pong
    # shellcheck disable=SC2039
    local i
    # shellcheck disable=SC2034
    # shellcheck disable=SC2039
    for i in {30..0}; do
      pong=$(redis-cli ping)
      echo "ping:$pong"
      if [ "$pong" = "PONG" ]; then
        break
      fi
      sleep 1
    done
    echo Temp server started.
}

temp_redis_server_stop() {
    redis-cli shutdown
}

exec_init_script() {
  echo
  # shellcheck disable=SC2039
  local f
	for f; do
		case "$f" in
			*.sh)
				if [ -x "$f" ]; then
					echo "running $f"
					"$f"
				else
					echo "$f No executable permission,sourcing $f"
					# shellcheck disable=SC1090
					. "$f"
				fi
				;;
			*)        echo "ignoring $f" ;;
		esac
		echo
	done
}

_main() {
  if [ -e "/init.script.d/" ] && [ "$(ls -A /init.script.d/)" ]; then
    temp_redis_server_start "$@"
	  exec_init_script /init.script.d/*
    temp_redis_server_stop -
  else
    echo /init.script.d/ not exist or without init files,skip script init!
  fi

  exec "$@"
}

_main "$@"



