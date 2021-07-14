#!/usr/bin/env bash

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$(dirname $0)

main() {
    args=()

    if [[ -n "${INPUT_VERSION:-}" ]]; then
        args+=(--version "${INPUT_VERSION}")
    fi

    if [[ -n "${INPUT_GITHUB_TOKEN:-}" ]]; then
        args+=(--github-token "${INPUT_GITHUB_TOKEN}")
    fi

    if [[ ${#args[@]} -eq 0 ]]
    then
        "$SCRIPT_DIR/install.sh"
    else
        "$SCRIPT_DIR/install.sh" "${args[@]}"
    fi
}

main
