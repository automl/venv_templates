#!/bin/bash

SOURCE_PATH="${BASH_SOURCE[0]:-${(%):-%x}}"
echo "Source path: "$SOURCE_PATH

RELATIVE_PATH="$(dirname "$SOURCE_PATH")"
ABSOLUTE_PATH="$(realpath "${RELATIVE_PATH}")"

echo "Sourcing config.sh from "$ABSOLUTE_PATH

# Loads the configuration: sets environment name and path to arguments passed or defaults
source "${ABSOLUTE_PATH}"/config.sh $1 $2

# (for HPCs) Loads preset modules
# source "${ABSOLUTE_PATH}"/modules.sh

# Creates the virtual environment
echo "Creating environment '"$ENV_NAME"' in "$ENV_DIR
python3 -m venv --prompt "$ENV_NAME" --system-site-packages "${ENV_DIR}"

# Sources the new environment (IMPORTANT: works only with `source`)
source "${ABSOLUTE_PATH}"/activate.sh $1 $2

# Installs dependencies
python3 -m pip install --upgrade -r "${3:-${ABSOLUTE_PATH}/requirements.txt}"

# end of file
