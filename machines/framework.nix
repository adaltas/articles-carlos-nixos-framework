{ config, pkgs, ...}:

{
    imports =
    [
        # Including the auto generated hardware scan file
        ./hardware-configuration.nix
        # Including configurations files
        <home-manager/nixos>
        ../system/common.nix
        ../system/apps.nix
        ../system/unstable.nix
        ../system/virtualization.nix
        ../system/zsh.nix
    ];

    # Defining a user account. Don't forget to set a password with ‘passwd’.
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

    # Home Manager configuration
    home-manager.users.carlos = { pkgs, config, ... }: {

        imports = [
          ../home/git.nix
          ../home/gnome.nix
          ../home/terminal.nix
          ../home/atom.nix
          ../home/vscode.nix
        ];

    };



}