{ config, lib, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware.nix
            ./system.nix
            ./program.nix
        ];
}

