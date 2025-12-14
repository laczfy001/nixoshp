{ config, pkgs, ... }:

{
environment = {
	systemPackages = with pkgs; [
		nordic
		dracula-theme
		gruvbox-gtk-theme
		yaru-theme
		sweet
		qogir-theme
		solarc-gtk-theme
		];
	};
}
