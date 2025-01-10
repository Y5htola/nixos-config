{ config, pkgs, inputs, ... }:
{
    programs.kitty= {
        enable = true;
        themeFile = "Argonaut";
        font = {
            name = "JetBrainsMono Nerd Font";
            size = 16;
        };
        settings = {
            background_opacity = 0.8;
            background_blur = 3;
            enabled_layouts = "tall";
            window_padding_width = 5; 
            cursor_shape = "beam";
        };
    };
}
