{ username, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = { enable = true; };
  };

  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
