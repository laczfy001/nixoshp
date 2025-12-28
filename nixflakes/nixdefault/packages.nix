{ config, pkgs, ... }:


{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [

    neovim
    gvfs
    udisks2
    notepadqq
    thunderbird
    slstatus
    feh
    sublime3
    iosevka
    nordic
    dunst
    libnotify
    mc
    fastfetch
    htop
    nemo-with-extensions
    gvfs
    redshift
    brightnessctl
    dmenu
    google-chrome
    inotify-tools
    rsync
    mesa
    #xorg.xf86video
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    dxvk
    intel-gpu-tools
    lxqt.screengrab
    discord
    dbus
    sysstat
    inkscape-with-extensions
    gimp
    pavucontrol
    lxappearance
    smartmontools
    networkmanager
    networkmanagerapplet
    tailscale
    alacritty
    fish
    oh-my-fish
    wineWowPackages.full
    lutris
    protonplus
	];
	};

}
