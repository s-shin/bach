# shellcheck disable=SC2148

: ${BACH_SYSTEM_LIBRARY_PATH:="${BACH_ROOT}/lib"}
: ${BACH_LIBRARY_PATH:=.:lib}

bach.find_module() {
  name="$1"
  IFS=: read -a paths <<< "$BACH_LIBRARY_PATH"
  IFS=: read -a sys_paths <<< "$BACH_SYSTEM_LIBRARY_PATH"
  for path in "${paths[@]}" "${sys_paths[@]}"; do
    for suffix in '' '.sh'; do
      target="${path}/${name}${suffix}"
      if [[ -f "$target" ]]; then
        echo "$target"
        return
      fi
    done
  done
  >&2 echo 'ERROR: not found.'
  return 1
}

bach.once() {
  key="bach.once.$(echo "$1" | sed -e 's#[^a-zA-Z0-9]#_#g')"
  if bach.session.isset "$key"; then
    return
  fi
  bach.session.set "$key"
  return 1
}
