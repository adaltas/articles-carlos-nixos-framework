{pkgs, ...}: {
  # This doesnt seem to work, no new profile displayed in termin preferences
  programs.gnome-terminal.profile.carlos = {
    default = true;
    audibleBell = true;
    cursorBlinkMode = true;
    cursorShape = "ibeam"; # "block", "ibeam", "underline"
    font = "Fira Code"; # "Fira Mono"
    showMenubar = false;
    built-in-schemes = "green on black";

  };
  dconf.settings = {
    "org/gnome/terminal/legacy/profiles:/:myself" = {
      default-size-columns = 120;
      default-size-rows = 60;
    };
  };
}
