{ pkgs ? import <nixpkgs> {} }:

pkgs.writeShellScriptBin "hello-workshop" ''
  echo "Hello from a Nix-built package!"
''
