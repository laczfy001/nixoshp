{ config, pkgs, unstable, ... }:


{
# List packages installed in system profile
    environment = {
        systemPackages = with pkgs; [

    font-awesome
    zstd
    vlc
    neovim
    #unstable.widelands
    font-awesome
    #brave
    librewolf
    #yad
    filezilla
    mysql-workbench
    libreoffice
    notepad-next
    vivaldi
    arandr
    gvfs
    udisks2
    unstable.faugus-launcher
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
    dwm
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
    unstable.heroic
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
    unstable.protonplus
	];
	};

}
