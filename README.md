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
docker compose run --rm nix
```

Inside the container:

```bash
nix --version
nix eval --expr '1 + 1'
nix shell nixpkgs#hello -c hello
```

Exit with `exit`. Files in `workspace/` are shared with your host.

## Build the example package

```bash
nix-build /workspace/hello.nix
./result/bin/hello-workshop
```

## Explore the NixOS configuration

Open `workspace/configuration.nix`. It illustrates hostname, timezone, SSH, packages and firewall declarations. It is a teaching example only; this Docker container cannot activate it as a NixOS system.

## More commands

```bash
nix eval --expr 'builtins.add 20 22'
nix shell nixpkgs#git nixpkgs#htop
nix shell nixpkgs#hello -c hello
nix-build /workspace/hello.nix
```

## Cleanup

```bash
docker compose down
docker image rm nixos/nix:2.35.5
```

## Need real NixOS behaviour?

To practise `nixos-rebuild`, systemd, boot generations and rollback, use a booted NixOS virtual machine (QEMU, UTM, VirtualBox or a cloud VM). A regular Nix Docker container is not a substitute.

## References

- Official image: <https://hub.docker.com/r/nixos/nix>
- Nix manual: <https://nix.dev/manual/nix/2.34/installation/installing-docker.html>
