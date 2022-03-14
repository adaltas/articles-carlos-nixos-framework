{ config, pkgs, ...}:

{
  # Using the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enabling WiFi
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enabling bluetooth
  hardware.bluetooth.enable = true;

  # Enabling fingerprint support
  services.fprintd.enable = true;

 # Enabling extra packages for hardware
  hardware.opengl.extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
    ];

  # Defining the network configuration
  networking.hostName = "abraxas";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;

  # Setting the time zone
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };

  # Enabling the X11 windowing system.
  services.xserver.enable = true;

  # Enabling the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.gnome-keyring.enable = true;
  environment.gnome.excludePackages = [
    pkgs.gnome.cheese pkgs.gnome-photos pkgs.gnome.gnome-music pkgs.epiphany pkgs.evince pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour  pkgs.gnome.geary
    ];


  # Configuring keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enabling sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enabling touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enabling the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}