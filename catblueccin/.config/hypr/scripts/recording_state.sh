#!/bin/bash
if pgrep -x wf-recorder >/dev/null; then
    printf "\uf28d\n"
else
    printf "\uf03e\n"
fi
