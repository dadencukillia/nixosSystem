{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Illia Diadenchuk";
      user.email = "dadencukillia@gmail.com";

      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
