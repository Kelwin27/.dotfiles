#!/usr/bin/env bash

if [[ -n ${AIP_ACTIVE:-} ]]; then
    exec "$@"
fi

if [[ ! -s $HOME/.config/sing-box/warp.key ]]; then
    printf '%s\n' "нет ключа WARP: ~/.config/sing-box/warp.key" >&2
    printf '%s\n' "  umask 077; mkdir -p ~/.config/sing-box" >&2
    printf '%s\n' "  wg genkey | tr -d '\n' > ~/.config/sing-box/warp.key" >&2
    exit 1
fi

systemctl --user start sing-box.service
trap 'systemctl --user stop sing-box.service' EXIT INT TERM

export AIP_ACTIVE=1
export HTTP_PROXY="http://127.0.0.1:2080"
export HTTPS_PROXY="$HTTP_PROXY"
export ALL_PROXY="$HTTP_PROXY"
export NO_PROXY="localhost,127.0.0.1,::1"

"$@"
