{ inputs, config, pkgs, home-manager, ... }:{

home.shellAliases = {
  rm = "trash";
  delete = "rm -rf";
  bin = "trash-list";
  recycle = "trash-empty"; 
  cat = "bat --style=plain --paging=never";
  pods = "podman-tui";
  df = "duf";
  du = "dust";
};

nix.settings.nix-path = "nixpkgs=flake:nixpkgs";


home.sessionVariables = {
  EDITOR = "nvim";
};

#home.file."zshfish.zsh-theme" = {
#  enable = true;
#  source = ./zshfish.zsh-theme;
#  target = ".oh-my-zsh/custom/themes/zshfish.zsh-theme";
#};

home.packages = with pkgs; [
  maple-mono-NF
  just
  tlrc
  duf
  dust
  up
  trash-cli
  podman
  podman-compose
  podman-tui
];

fonts.fontconfig.enable = true;

programs = { 
  home-manager.enable = true;
  fish.enable = true;
  zoxide.enable = true;
  thefuck.enable = true;
  ripgrep.enable = true;
};

programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true ;
  syntaxHighlighting.enable = true;
  oh-my-zsh = {
    enable = true;
    theme = "fishy";
  };
};

programs.git = {
  enable = true;
  userName = "dog-in-space"; userEmail = "github.ferilli@simplelogin.com"; 
};

programs.gh = {
  enable = true;
  gitCredentialHelper.enable = true; 
};

programs.neovim = {
  enable = true;
  viAlias = true; vimAlias = true; 
};

programs.fzf = {
  enable = true;
  defaultOptions = [ "--height=40%" "--layout=reverse" "--border" "--preview='bat --color=always --style=numbers --line-range=:500 {}'" "--preview-window=right:50%" "--multi" "--ansi" ]; 
};

programs.bat = {
  enable = true;
  config = { pager = "less -FR"; theme = "TwoDark"; style = "grid,header,header-filesize";}; 
};

programs.eza = {
  enable = true;
  extraOptions = [ "--group-directories-first" "--header" "--icons" "--grid" ]; 
};
}