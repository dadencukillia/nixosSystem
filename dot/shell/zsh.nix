{ ... }:

{
  programs.zsh = {
    enable = true;
    initContent = ''
      # Disable Oh My Zsh from overriding the prompt
      PROMPT=""
      RPROMPT=""
      
      # Initialize Oh My Posh (Replace with your actual config path)
      eval "$(oh-my-posh init zsh)"
    '';
  };
}
