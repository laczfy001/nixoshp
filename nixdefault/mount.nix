{ config, pkgs, ... }:

{
  #Filesystems - mounted
  fileSystems."/mnt/backup" = {
  device = "//192.168.0.109/adat";
  fsType = "cifs";
  options = [ "username=laci" "password=Vl199104197" "x-systemd.automount" "auto" "uid=1000"  ]; 
  };
  fileSystems."/mnt/laci" = {
  device = "//192.168.0.185/adat/Laci";
  fsType = "cifs";
  options = [ "username=laczfy" "password=Vl199104197" "x-systemd.automount" "auto" "uid=1000" ];
  };
  fileSystems."/mnt/torrent" = {
  device = "//192.168.0.101/torrent";
  fsType = "cifs";
  options = [ "username=mediaserver" "password=mediaserverpass012" "x-systemd.automount" "auto" "uid=1000" ];
  };
  fileSystems."/mnt/media" = {
  device = "//192.168.0.102/media";
  fsType = "cifs";
  options = [ "username=movies" "password=mediaserverpass012" "x-systemd.automount" "auto" "uid=1000" ];
  };
  fileSystems."/mnt/sorozatok" = {
  device = "//192.168.0.104/mediaserver2";
  fsType = "cifs";
  options = [ "username=mediaserver2" "password=mediaserverpass012" "x-systemd.automount" "auto" "uid=1000" ];
  };
  fileSystems."/mnt/sorozatok3" = {
  device = "//192.168.0.106/sorozatok3";
  fsType = "cifs";
  options = [ "username=mediaserver3" "password=mediaserverpass012" "x-systemd.automount" "auto" "uid=1000" ];
  };
  
}
