{
  description = "A Nix-flake-based Zig development environment";

  inputs =  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zig-overlay.url = "github:mitchellh/zig-overlay";
    zls-overlay.url = "github:zigtools/zls";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    zig = inputs.zig-overlay.packages.x86_64-linux.default;
    # zig = inputs.zig-overlay.packages.x86_64-linux.master;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = [
        pkgs.zls
        zig
     
      ];
    };
  };
}

