{ pkgs, ... }:
{
  users.users.spice = {
    description = "ταφ";
    hashedPassword = "$y$j9T$ESLpEbpQbXte5fXg7bjsq0$9Zo41KD0/A6a3DliR58plTKv8ryaLnOGdpESKOjn0wB";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    shell = pkgs.nushell;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHjyDnNQvxO+Xj4Jp42F67LmOAiHrQtJwhwVPkDHQ3Ep spicesw@proton.me"
    ];
  };

  users.users.builder = {
    isSystemUser = true;
    group = "builder";
  };

  users.groups.builder = { };

  users.mutableUsers = false;

  environment.systemPackages = [
    pkgs.nushell
    pkgs.git
    pkgs.tmux
    pkgs.nix-output-monitor
    pkgs.btop
  ];
}
