{config, pkgs, ...}: {

  programs.zsh = {
    enable = true;
#    initExtra = ''
#    #eval "$(direnv hook zsh)"
#    [ -f ~/.secrets ] && . ~/.secrets
#    export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
#    # Preserve the current directory of the shell across terminals
#    # Note, tried `programs.zsh.vteIntegration` without sucess
#    source ${pkgs.gnome3.vte}/etc/profile.d/vte.sh
#    '';
    };

  users.defaultUserShell = pkgs.zsh;

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" "docker" "kubectl" ];
    theme = "amuse";
  };
}
