{...}: {
  imports = [];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."virajs-desktop" = {
    isNormalUser = true;

    extraGroups = ["wheel"];
  };
  system.userActivationScripts.clearDmenuCache = ''
    rm -f ~/.cache/dmenu_run_desktop
  '';
}
