# SOURCE_PATH="${BASH_SOURCE[0]:-${(%):-%x}}"
# echo $SOURCE_PATH

get_source_path() {
    local source="${1:-${(%):-%x}}"
    local dir="$(cd "$(dirname "$source")" && pwd)"  # for absolute path
    local base="$(basename "$source")"  # for filename
    echo "$dir/$base"
}
SOURCE_PATH4="$(get_source_path "${BASH_SOURCE[0]}")"
echo $SOURCE_PATH4

## Check if this script is sourced
[[ "$0" != "${SOURCE_PATH}" ]] && echo "Setting vars" || ( echo "Vars script must be sourced." && exit 1) ;
## Determine location of this file
RELATIVE_PATH="$(dirname "$SOURCE_PATH")"
ABSOLUTE_PATH="$(realpath "${RELATIVE_PATH}")"

####################################

### User Configuration
export ENV_NAME="$(basename "$ABSOLUTE_PATH")"             # Default Name of the venv is the directory that contains this file
export ENV_DIR="${ABSOLUTE_PATH}"/venv         # Default location of this VENV is "./venv"
