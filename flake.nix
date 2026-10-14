{
  description = "KelWin's fork of FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mcp-nixos.url = "github:utensils/mcp-nixos";
    serena.url = "github:oraios/serena";
  };

  outputs =
    {
      nixpkgs,
      nvf,
      self,
      ...
    }@inputs:
    let
      username = "kelwin";
      nodpiPath = "/home/kelwin/NoDPI";
      inherit (nixpkgs) lib;
      mkSystem =
        host: modules:
        nixpkgs.lib.nixosSystem {
          modules = modules ++ [
            {
              networking.hostName = lib.mkForce host;
            }
          ];
          specialArgs = {
            inherit
              self
              inputs
              username
              host
              nodpiPath
              ;
          };
        };
    in
    {
      nixosConfigurations = {
        desktop = mkSystem "desktop" [
          ./hosts/desktop
          nvf.nixosModules.default
        ];

        laptop = mkSystem "laptop" [
          ./hosts/laptop
          nvf.nixosModules.default
        ];

        vm = mkSystem "vm" [
          ./hosts/vm
          nvf.nixosModules.default
        ];
      };
    };
}
