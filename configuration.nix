# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan and other channels
      ./hardware-configuration.nix
      ./unstable.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Enable WiFi
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Enable bluetooth
  hardware.bluetooth.enable = true;
  # Enable fingerprint support
  services.fprintd.enable = true;

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
];

  networking.hostName = "abraxas"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # services.xserver.desktopManager.lxqt.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.carlos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # Security
    security.sudo.extraRules = [{
    groups = [ "wheel" ];
    commands = [ {
      command = "ALL"; options = [ "NOPASSWD" ];
    } ];
  }];

  # Allow non open-source software
  nixpkgs.config.allowUnfree = true;

  # Keybase service
  services.keybase.enable = true;
  services.kbfs.enable = true;

  # Enabling Docker
  virtualisation.docker.enable = true;

  # Enabling ZSH
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Enable OhMyZsh
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = ["git" "sudo" "docker"];
    theme = "amuse";
  };

  # Enable auto upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Enable VirtualBox and networking setup
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

   environment.etc."vbox/networks.conf".text = ''
    * 10.10.10.0/24 192.168.56.0/21
    * 2001::/64
  '';
   users.extraGroups.vboxusers.members = [ "carlos" ];

  # Adding extra host names
  networking.extraHosts = 
	''
	  10.10.10.11 master01.nikita.local
	  10.10.10.16 worker01.nikita.local
	  10.10.10.17 worker02.nikita.local
	  10.10.10.18 worker03.nikita.local
	'';

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; 
  # Defining the R packages
  let 
    RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages; 
	[ ggplot2 dplyr xts tidyverse forecast xlsx lubridate zoo tidyr]; };
  in 
  # Listing all the packages to be installed system wide
    [
    RStudio-with-my-packages
    vim
    wget
    tmux
    git
    libreoffice
    thunderbird
    keybase
    keybase-gui
    yarn
    nodejs
    postman
    vscode
    python
    tusk #evernote
    p3x-onenote
    cmatrix
    vlc
    whatsapp-for-linux
    aws
    zsh
    tree
    vagrant
    atom
    sublime4
    gitg
    bpytop
    ansible
    google-chrome
    terminator
    ed
    openssl
    slack
    obs-studio
    brave
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}

