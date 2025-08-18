{ constants, ... }:

{
  programs.git = {
    enable = true;
    userName = constants.user.name;
    userEmail = constants.user.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}