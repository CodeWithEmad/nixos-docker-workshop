{ config, pkgs, ... }:

{
  # Teaching example only: this NixOS module is not applied by this container.
  networking.hostName = "workshop-server";
  time.timeZone = "Europe/Berlin";

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    curl
  ];

  networking.firewall.enable = true;

  # Keep this aligned with the system's original installation version.
  system.stateVersion = "24.11";
}
