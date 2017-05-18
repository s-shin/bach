# shellcheck disable=SC2148
if bach.once "$BASH_SOURCE"; then return; fi

bach.load_config() {
  for file in "$@"; do
    bach-yml2sh -p 'config.' "$file"
  done
}
