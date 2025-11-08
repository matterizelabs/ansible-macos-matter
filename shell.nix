{ pkgs ? import <nixpkgs> {} }:

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
    helix
    git
    curl
    wget
  ];

  shellHook = ''
    echo "Ansible development environment loaded"
  '';
}
