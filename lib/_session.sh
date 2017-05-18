# shellcheck disable=SC2148

: ${BACH_SESSION_DIR:="${HOME}/.bach/session/$$"}

mkdir -p "$BACH_SESSION_DIR"

bach.session.set() {
  key="$1"
  value="${2:-}"
  echo -n "$value" > "${BACH_SESSION_DIR}/${key}"
}

bach.session.get() {
  key="$1"
  cat "${BACH_SESSION_DIR}/${key}"
}

bach.session.isset() {
  key="$1"
  [[ -f "${BACH_SESSION_DIR}/${key}" ]]
}

bach.session.del() {
  key="$1"
  rm "${BACH_SESSION_DIR}/${key}"
}
