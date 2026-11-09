# A NixOS configuration file: you describe the whole machine declaratively,
# and NixOS builds a system matching it. Comments in Nix start with '#'.

# The file is a function. It takes a set of arguments (the part in { })
# and returns a set of settings (the second { } block below).
#   config = the final merged configuration of the whole system
#   pkgs   = the big collection of installable packages (nixpkgs)
#   ...    = accept any other arguments NixOS passes in, ignore them
{ config, pkgs, ... }:

{
  # Teaching example only: this NixOS module is not applied by this container.

  # Machine name on the network. "a.b = x;" is shorthand for nested sets.
  networking.hostName = "workshop-server";
  # System clock timezone.
  time.timeZone = "Europe/Berlin";

  # Install and start the SSH server (sshd) so you can log in remotely.
  services.openssh.enable = true;

  # Packages installed for every user on the system.
  # "with pkgs;" lets us write `vim` instead of `pkgs.vim`.
  # List items are separated by whitespace, not commas.
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
  ];

  # Turn on the firewall (blocks incoming connections by default).
  networking.firewall.enable = true;

  # Keep this aligned with the system's original installation version.
  # It is NOT the version you run: it only keeps old stateful data
  # (databases, etc.) compatible. Don't change it when upgrading.
  system.stateVersion = "24.11";
}
