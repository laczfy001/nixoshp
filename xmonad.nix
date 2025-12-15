{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    haskell-language-server
    xmobar
    rofi
    networkmanager_dmenu
    rofi-power-menu
  ];

  services = {
    xserver = {
      enable = true;
      windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
	  # extraPackages = hpkgs: [
          #   # hpkgs.xmonad-log-polybar
          # ];
        };
      };
    };
  };
}
