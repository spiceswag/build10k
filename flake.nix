{
  description = "build farm 10000";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
  };

  outputs =
    { self, nixpkgs }@inputs:
    {
      nixosConfigurations."build10k" = nixpkgs.lib.nixosSystem {
        modules = [
          ./src/system.nix
          ./src/users.nix
          {
            nixpkgs.hostPlatform = "x86_64-linux";
            networking.hostName = "build10k";
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
