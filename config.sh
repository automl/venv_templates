SOURCE_PATH="${BASH_SOURCE[0]:-${(%):-%x}}"

## Check if this script is sourced
[[ "$0" != "${SOURCE_PATH}" ]] && echo "Setting vars" || ( echo "Vars script must be sourced." && exit 1) ;
## Determine location of this file
RELATIVE_PATH="$(dirname "$SOURCE_PATH")"
ABSOLUTE_PATH="$(realpath "${RELATIVE_PATH}")"

####################################

### User Configuration: uses arguments $1 and $2 if passed or defaults
export ENV_NAME="${1:-$(basename "$ABSOLUTE_PATH")}"  # Default Name of the venv is the directory that contains this file
ENV_DIR="${2:-${ABSOLUTE_PATH}/venv}"  # Default location of this VENV is "./venv"
export VENV_DIR=$(realpath "${ENV_DIR}")
export ENV_DIR=${ENV_DIR}/${ENV_NAME}
export VENV_REPO_DIR="${ABSOLUTE_PATH}"

echo ""
echo "\$ENV_NAME: "$ENV_NAME
echo "\$ENV_DIR: "$ENV_DIR
echo "\$VENV_DIR: "$VENV_DIR
echo "\$VENV_REPO_DIR: "$VENV_REPO_DIR

# end of file
