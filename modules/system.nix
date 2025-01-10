{lib, config, pkgs, ...}:

{
    #################### Boot Loader ####################
    boot.loader = {
        efi.canTouchEfiVariables = true;
        efi.efiSysMountPoint = "/efi";
        grub = {
            efiSupport = true;
            device = "nodev";
            extraEntries = ''
	           menuentry "Windows" {
	             search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
	             chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
	           }
            '';
        };
    };

    #################### Network ####################
    networking.hostName = "nixos";
    time.timeZone = "Asia/Shanghai";
    networking.networkmanager.enable = true;
    # proxy
    # networking.proxy.default = "http://192.168.0.106:7890";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    
    #################### Localization ####################
    i18n.defaultLocale = "en_US.UTF-8";
    fonts = {
        packages =  with pkgs; [
            (nerdfonts.override { fonts = [ "JetBrainsMono"]; })
            font-awesome
            noto-fonts-color-emoji
            lxgw-wenkai
            texlivePackages.ysabeau
        ];
        fontconfig = {
            defaultFonts = {
                serif = [  "Ysabeau" "LXGW WenKai" ];
                emoji = [" Noto Color Emoji" ];
            };
        };
    };
   
    #################### User Account ####################
    users.users.y5htola = {
        isNormalUser = true;
        home = "/home/y5htola";
        extraGroups = [ "wheel" "networkmanager" "libvirtd"];
    };
   
    #################### Accelerated Video Playback ####################
    hardware.graphics= {
        enable = true;
        extraPackages = with pkgs; [ 
            intel-media-driver  
            intel-ocl
        ]; 
    };
    environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
}
