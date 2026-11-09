# A Nix expression that builds one small package. Build it with `nix-build hello.nix`.

# The file is a function with one argument, `pkgs`.
# "? import <nixpkgs> {}" is the default value: if you pass nothing,
# load the standard package collection (nixpkgs) from your system.
{ pkgs ? import <nixpkgs> {} }:

# writeShellScriptBin makes a package containing one executable shell script.
#   1st argument: the command name ("hello-workshop", ends up in bin/)
#   2nd argument: the script text, between '' ... '' (multi-line string)
pkgs.writeShellScriptBin "hello-workshop" ''
  echo "Hello from a Nix-built package!"
''
