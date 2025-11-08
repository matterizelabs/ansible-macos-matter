{ pkgs ? import (builtins.fetchTarball "https://github.com/nixos/nixpkgs/archive/refs/heads/nixos-25.05.tar.gz") {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Ansible and core tools
    ansible
    python311
    python311Packages.jinja2
    python311Packages.pyyaml
    python311Packages.paramiko

    # Language servers
    yaml-language-server
    ansible-language-server

    # Editor and development tools
    # helix # (if you prefer helix)
    git
    curl
    wget
  ];

  shellHook = ''
    export MACOS_HOST=${MACOS_HOST:-192.168.10.2}
    export MACOS_SSH_USER=${MACOS_SSH_USER:-user}

    echo "Ansible development environment loaded"
    echo "MACOS_HOST=$MACOS_HOST"
    echo "MACOS_SSH_USER=$MACOS_SSH_USER"
  '';
}
