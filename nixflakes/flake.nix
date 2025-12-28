{
  description = "NixOS Flake with stable and unstable channels";

  inputs = {
    # Stable NixOS (main system)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";    
    # Xlibre
    xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";
    # Unstable channel (for some newer packages)
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, xlibre-overlay, ... }:
  let
    system = "x86_64-linux";

    # Import both stable and unstable package sets
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit unstable; }; # így tudod használni a modulokban
      modules = [
        ./configuration.nix

        xlibre-overlay.nixosModules.overlay-xlibre-xserver
        xlibre-overlay.nixosModules.overlay-xlibre-xf86-video-intel
	xlibre-overlay.nixosModules.overlay-xlibre-xf86-input-libinput
      ];
    };
  };
}
