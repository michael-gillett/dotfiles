deti() {
  docker run --rm -it --entrypoint "/bin/sh" "$1"
}
