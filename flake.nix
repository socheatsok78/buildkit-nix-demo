# syntax=socheatsok78/nixfile-frontend:experimental
{
  description = "This is a demo project for showcasing the capabilities of socheatsok78/buildkit-nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {

      legacyPackages = forAllSystems (
        system:
        import ./default.nix {
          pkgs = import nixpkgs { inherit system; };
        }
      );

      packages = forAllSystems (
        system:
        import ./default.nix {
          pkgs = import nixpkgs { inherit system; };
        }
      );

      # nix fmt (experimental)
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

    };
}
