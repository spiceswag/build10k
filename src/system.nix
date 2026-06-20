{ lib, inputs, ... }:
{
  boot.isContainer = true;

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    channel.enable = false;
    registry = lib.mapAttrs (_: input: { flake = input; }) inputs;

    gc = {
      automatic = true;
      dates = [
        "*-*-* 00:00:00"
        "*-*-* 12:00:00"
      ];
      persistent = true;
    };
  };

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Athens";
  i18n.defaultLocale = "en_US.UTF-8";

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
    };
  };

  system.stateVersion = "26.05";
}
