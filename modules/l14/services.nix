{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # If you have problems with mic
  # https://github.com/NixOS/nixpkgs/issues/271847#issuecomment-1895533566
  # enable pulse audio, comment, rkit, and disable pipewire
  # or
  # rm -rf ~/.local/state/wireplumber
  # systemctl --user start pipewire-pulse pipewire wireplumber
  # select all the family stuff

  # Use pipewire the modern soundsystema
  services.pulseaudio.enable = true;
  #  security.rtkit.enable = true;
  services.pipewire = {
    enable = false;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

    services.samba = {
        enable=false;
        openFirewall = true;
        settings={
            "qemu_share"={
                "path" = "/home/jim/Downloads";
                "valid users" = "jim";
                "read only" = "no";
                "guest ok" = "no";
            };
        };
    };

    # enables fingerprint support for thinkpad 06cb:00bd Synaptics Sensors
  # broken in 25.05
  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;


  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jim";
}
