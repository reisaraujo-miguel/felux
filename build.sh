#!/bin/bash

set -ouex pipefail

# Constants
export RELEASE
RELEASE="$(rpm -E %fedora)"

export BUILD_FILES_DIR="/tmp"
export SCRIPTS_DIR="${BUILD_FILES_DIR}/scripts"
export SYSTEM_FILES_DIR="${BUILD_FILES_DIR}/system_files"

# Validate environment
[[ -z "$RELEASE" ]] && {
    echo "Failed to determine Fedora release"
    exit 1
}

[[ ! -d "$BUILD_FILES_DIR" ]] && {
    echo "Build files directory not found"
    exit 1
}

# Helper Functions
execute_script() {
    local script="$1"
    local script_path="${SCRIPTS_DIR}/${script}"

    if [[ ! -x "$script_path" ]]; then
        echo "Error: Script ${script} not found or not executable"
        return 1
    fi

    echo "Executing ${script}..."
    "$script_path" || {
        echo "Error: ${script} failed"
        return 1
    }
}

install_packages() {
    local pkg_file="$1"

    mapfile -t packages <"$pkg_file"

    if rpm-ostree install --idempotent -y "${packages[@]}"; then
        return 0
    fi

    return 1
}

remove_packages() {
    local pkg_file="$1"

    mapfile -t packages <"$pkg_file"

    if rpm-ostree override remove "${packages[@]}" --install neovim-default-editor; then
        rm /etc/profile.d/vscode-bluefin-profile.sh
        rm -r /etc/skel/.config/Code/
        return 0
    fi

    return 1
}

# Main Installation Steps
main() {
    # Install Copr Repos
    execute_script "set-extra-repos.sh"

    # Install Required Packages
    install_packages "${BUILD_FILES_DIR}/install-pkgs"

    # Remove Unwanted Packages
    remove_packages "${BUILD_FILES_DIR}/remove-pkgs"

    # Configure Desktop Environment
    execute_script "branding.sh"
    execute_script "configure-zsh.sh"
    execute_script "set-wallpaper.sh"

    # Install System Files
    execute_script "copy-system-files.sh"

    # Disbale extra repos
    execute_script "unset-extra-repos.sh"
}

main
