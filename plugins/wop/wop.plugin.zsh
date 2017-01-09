: ${WOP_WORK_DOMAIN:?not set}
: ${WOP_REPO_URL:?not set}

: ${WOP_PLUGIN_LOC:=.wop}
: ${WOP_WORK_RC:=.wop-work.zsh}
: ${WOP_PERSONAL_RC:=.wop-personal.zsh}
: ${WOP_WORK_RC_LOC:=$WOP_PLUGIN_LOC/$WOP_WORK_RC}
: ${WOP_PERSONAL_RC_LOC:=$WOP_PLUGIN_LOC/$WOP_PERSONAL_RC}

local host_name="$(hostname)"
local fqdn="$(host $host_name)"
if [[ "$fqdn" =~ ".*\.$WOP_WORK_DOMAIN" ]]; then
  antigen bundle "$WOP_REPO_URL" "$WOP_WORK_RC_LOC"
else
  antigen bundle "$WOP_REPO_URL" "$WOP_PERSONAL_RC_LOC"
fi
