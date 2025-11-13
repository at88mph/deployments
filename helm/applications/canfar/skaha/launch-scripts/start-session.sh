#!/bin/bash

# To exit immediately on any status code other than zero
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: start-session.sh <session type>"
    echo "e.g., start-session.sh notebook"
    exit 2
fi

SESSION_TYPE="${1}"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

case SESSION_TYPE in
  "notebook")
    "${SCRIPT_DIR}"/start-jupyterlab.sh
    ;;
  "desktop")
    "${SCRIPT_DIR}"/start-desktop.sh
    ;;
  "carta")
    "${SCRIPT_DIR}"/skaha-carta.sh
    ;;
  *) # Default case (matches any other value)
    DEFAULT_COMMANDS
    ;;
esac
