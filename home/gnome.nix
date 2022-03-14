{ config, pkgs, ... }: {

  gtk = {
    enable = true;
    theme = {
      name = "HighContrastInverse";
      package = pkgs.arc-theme;
    };
    # theme = {
    #   name = "Arc-Dark";
    #   package = pkgs.arc-theme;
    # };
    # theme = {
    #   name = "Adwaita-dark";
    #   # package = pkgs.arc-theme;
    # };
    # theme = {
    #   name = "Qogir-dark";
    #   package = pkgs.qogir-theme;
    # };
  };

  home.packages = with pkgs; [
    # arc-theme
    # qogir-theme
  ];

  dconf.settings = {
    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };
    "org/gnome/desktop/peripherals" = {
      touchpad = "fingers";
    };
    "org/gnome/desktop/input-sources" = {
      sources = [ ["xkb" "us"]  ];
      xkb-options = ["ctrl:swap_lalt_lctl"];
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      "speed" = 0.5;
    };
    "org/gnome/terminal/legacy/keybindings" = {
      close-tab = "<Primary>w";
      close-window = "<Primary>q";
      copy = "<Primary>c";
      new-tab = "<Primary>t";
      new-window = "<Primary>n";
      next-tab = "<Primary><Shift>Right";
      paste = "<Primary>v";
      prev-tab = "<Primary><Shift>Left";
      reset-and-clear = "<Primary>k";
    };
    "org/gnome/system/location" = {
      enabled = true;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      "sleep-inactive-ac-timeout" = 0;
      "sleep-inactive-battery-timeout" = 0;
    };
  };

}
