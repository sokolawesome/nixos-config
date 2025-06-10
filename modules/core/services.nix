{ pkgs, ... }:

{
  services = {
    gvfs.enable = true;
    dbus.enable = true;
    dbus.packages = with pkgs; [ gcr gnome-settings-daemon ];
    fstrim.enable = true;
    gnome.gnome-keyring.enable = true;
  };
}
