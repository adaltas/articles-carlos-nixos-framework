{ config, pkgs, lib, ... }: {

    # Enabling Docker
    virtualisation.docker.enable = true;

    # https://nixos.wiki/wiki/Vagrant
    services.nfs.server.enable = true;
    networking.firewall.extraCommands = ''
      ip46tables -I INPUT 1 -i vboxnet+ -p tcp -m tcp --dport 2049 -j ACCEPT
     '';

    # Enabling VirtualBox and networking setup
    virtualisation.libvirtd.enable = true;

    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
      addNetworkInterface = true;
    };

    networking.interfaces.vboxnet0.ipv4.addresses = lib.mkOverride 10 [{
      address = "10.10.10.1";
      prefixLength = 24;
    }];

    users.extraGroups.vboxusers.members = [ "carlos" ];
    environment.etc."vbox/networks.conf".text = ''
      * 10.10.10.0/24 192.168.56.0/21
      * 2001::/64
    '';

    # Adding extra host names
    networking.extraHosts =
      ''
    	10.10.10.11 master01.nikita.local
    	10.10.10.16 worker01.nikita.local
    	10.10.10.17 worker02.nikita.local
    	10.10.10.18 worker03.nikita.local
      '';
}