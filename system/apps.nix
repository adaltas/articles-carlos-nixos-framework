{ pkgs, ...}:

{
    # Allowing installation of proprietary or unfree package
    nixpkgs.config.allowUnfree = true;

    # Enabling Keybase service
    services.keybase.enable = true;
    services.kbfs.enable = true;

    environment.systemPackages = with pkgs;
      # Defining the R packages
      let
        RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages;
    	[ ggplot2 dplyr xts tidyverse forecast xlsx lubridate zoo tidyr]; };
      in
      # Listing all the packages to be installed system wide
        [
        # Software development applications
        RStudio-with-my-packages
        vim
        wget
        tmux
        git
        yarn
        nodejs
        postman
        vscode
        python39Full
        aws
        zsh
        tree
        vagrant
        atom
        sublime4
        gitg
        bpytop
        ansible
        ed
        openssl
        xclip

        # Office applications
        libreoffice
        thunderbird
        keybase
        keybase-gui
        tusk #evernote
        p3x-onenote

        # Other applications
        cmatrix
        vlc
        whatsapp-for-linux
        google-chrome
        obs-studio
        brave
        apple-music-electron
      ];

}