{ config, pkgs, inputs, ... }:
let
  package = pkgs.hyprland;
in {
    wayland.windowManager.hyprland = {
        enable = true;
        #xwayland.enable = true;
        settings = {
            env = [
                # ozone-based browser & electron apps run on wayland
                # This environment variable causes Obsidian to be unable to use the fcitx5 input method 
                #"NIXOS_OZONE_WL,1"

                # firefox run on wayland
                "MOZ_ENABLE_WAYLAND,1"
                "MOZ_WEBRENDER,1"

                # Abstract Window Toolkit use non-reparenting
                "_JAVA_AWT_WM_NONREPARENTING,1"
                
                # See https://wiki.hyprland.org/Configuring/Environment-variables/
                "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
                "QT_QPA_PLATFORM,wayland"
                "SDL_VIDEODRIVER,wayland"
                "GDK_BACKEND,wayland"
            ];
        };
        extraConfig = builtins.readFile ../config/hypr/hyprland.conf;
    };
    
    # NOTE: this executable is used by greetd to start a wayland session when system boot up
    # with such a vendor-no-locking script, we can switch to another wayland compositor without modifying greetd's config in NixOS module
    home.file.".wayland-session" = {
        source = "${package}/bin/Hyprland";
        executable = true;
    };
    
    xdg.configFile = {
        "hypr/wallpaper.png" = {
            source = ../config/hypr/wallpaper.png;
            recursive = true;
        };
        "hypr/scripts" = {
            source = ../config/hypr/scripts;
            recursive = true;
        };
        "hypr/waybar" = {
            source = ../config/hypr/waybar;
            recursive = true;
        };
        "hypr/wlogout" = {
            source = ../config/hypr/wlogout;
            recursive = true;
        };
    };
}
