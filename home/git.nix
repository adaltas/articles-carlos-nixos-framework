{pkgs, ...}:
    {
      programs.git = {
        enable = true;
        userName  = "Carlos Jesus Caro";
        userEmail = "carlos@adaltas.com";
        aliases = {
          lgb = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit --date=relative --branches";
        };
        extraConfig = {
          init = {
            defaultBranch = "main";
          };
        pull = {
            rebase = true;
            };
        credential.helper = "${
            pkgs.git.override { withLibsecret = true; }
          }/bin/git-credential-libsecret";
        };
      };
    }
