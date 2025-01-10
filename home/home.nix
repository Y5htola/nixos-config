{ config, pkgs, inputs, ... }:

{
    home.stateVersion = "24.11";
    home.username = "y5htola";
    home.homeDirectory = "/home/y5htola";
    home.packages = with pkgs; [
        waybar
        inputs.anyrun.packages.${system}.anyrun
        wlogout
        swaybg

        xdg-user-dirs
        neofetch
        yazi
        alsa-utils
        brightnessctl
        grim
        slurp
        wl-clipboard
        libva-utils

        zotero 
        obsidian 
        inputs.zen-browser.packages."${system}".beta
    ];

    xdg.userDirs = {
        createDirectories = true;
    };

    programs.home-manager.enable = true;

    programs.git = {
        enable = true;
        userName = "y5htola";
        userEmail = "y5htola@outlook.com";
    };
     
    imports = [ 
        ./program/anyrun.nix
        ./program/hyprland.nix
        ./program/bash.nix
        ./program/kitty.nix
        ./program/neovim.nix
    ];
}
