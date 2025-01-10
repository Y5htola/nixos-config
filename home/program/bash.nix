{ config, pkgs, inputs, ... }:

{
    programs.bash = {
        enable = true;
        enableCompletion = true;
        bashrcExtra = builtins.readFile ../config/bash/bashrc;
    };
}
