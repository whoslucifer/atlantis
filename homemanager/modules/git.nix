{userConfig, ...}: {
  # Install git via home-manager module
  programs.ssh = {
    enable = true;

    # Add the SSH private key directly
    keys."github" = {
      keyContents = ''
        SHA256:+QhbOoQ5BMls/gtRrWuH5kDh7Li9pow69aB91mWsGs0
      '';
      permissions = "0600"; # Secure permissions
    };
  };

  programs.git = {
    enable = true;
    userName = userConfig.fullName;
    userEmail = userConfig.email;
    signing = {
      key = userConfig.gitKey;
      signByDefault = true;
    };
    delta = {
      enable = true;
      options = {
        keep-plus-minus-markers = true;
        light = false;
        line-numbers = true;
        navigate = true;
        width = 280;
      };
    };
    extraConfig = {
      pull.rebase = "true";
    };
  };
}
