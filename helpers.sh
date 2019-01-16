# Helper print functions
bold=$(tput bold)
normal=$(tput sgr0)

title () {
  echo ${bold}$1${normal}
}

subtitle () {
  echo "  " $1;
}
