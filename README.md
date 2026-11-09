# Nix in Docker — team workshop starter

A disposable Nix environment for learning without installing Nix on each laptop.

**Important:** this is Nix inside Docker, not a full NixOS machine. It shares the host kernel. You can learn the Nix CLI, evaluate expressions and use Nix packages, but you cannot boot NixOS, manage its systemd services, or apply a full system configuration with `nixos-rebuild switch`.

## Requirements

- Docker Engine or Docker Desktop
- Docker Compose v2 (`docker compose`)
- Internet access to download packages

## Start

From this directory:

```bash
# Start a throwaway container from the "nix" service in docker-compose.yml
# and open a shell in it. --rm deletes the container when you exit.
docker compose run --rm nix
```

Inside the container:

```bash
# Print the installed Nix version (checks Nix works)
nix --version

# Evaluate a Nix expression and print the result (prints 2)
nix eval --expr '1 + 1'

# Download the "hello" package from nixpkgs (the package collection),
# then run `hello` inside a temporary shell. -c = command to run.
# Nothing is installed permanently.
nix shell nixpkgs#hello -c hello
```

Exit with `exit`. Files in `workspace/` are shared with your host.

## Build the example package

```bash
# Build the package defined in hello.nix. Nix stores it in /nix/store
# and creates a `result` symlink in the current directory pointing to it.
nix-build /workspace/hello.nix

# Run the program from the built package (prints the greeting)
./result/bin/hello-workshop
```

## Explore the NixOS configuration

Open `workspace/configuration.nix`. It illustrates hostname, timezone, SSH, packages and firewall declarations. It is a teaching example only; this Docker container cannot activate it as a NixOS system.

## More commands

```bash
# Call a built-in Nix function: add 20 and 22 (prints 42)
nix eval --expr 'builtins.add 20 22'

# Open an interactive shell with git and htop available.
# Several packages can be listed. `exit` leaves the shell; they disappear.
nix shell nixpkgs#git nixpkgs#htop

# Run one command from a package, then return to your normal shell
nix shell nixpkgs#hello -c hello

# Rebuild the example package (same as in "Build the example package")
nix-build /workspace/hello.nix
```

`nixpkgs#hello` means "package `hello` from the `nixpkgs` collection".

## Cleanup

```bash
# Stop and remove containers/networks created by docker-compose.yml
docker compose down

# Delete the downloaded Nix image to free disk space
docker image rm nixos/nix:2.35.5
```

## Need real NixOS behaviour?

To practise `nixos-rebuild`, systemd, boot generations and rollback, use a booted NixOS virtual machine (QEMU, UTM, VirtualBox or a cloud VM). A regular Nix Docker container is not a substitute.

## References

- Official image: <https://hub.docker.com/r/nixos/nix>
- Nix manual: <https://nix.dev/manual/nix/2.34/installation/installing-docker.html>
