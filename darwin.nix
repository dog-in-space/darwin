{ self, inputs, config, pkgs, home-manager, nix-darwin, ... }:{

system.stateVersion = 5;
services.nix-daemon.enable = true;
nix.settings.experimental-features = "nix-command flakes";

programs.zsh.enable = true;

home-manager.useGlobalPkgs = true;
home-manager.useUserPackages = true;

security.pam.enableSudoTouchIdAuth = true;

homebrew = {
  enable = true;

  taps = [
    "homebrew/services"
    "lizardbyte/homebrew"
  ];

  brews = [
    "sunshine-beta"
    "mas"
  ];

  casks = [
    "discord"
    "iterm2"
    "moonlight"
    "motrix"
    "obsidian"
    "pearcleaner"
    "proton-drive"
    "proton-mail"
    "proton-pass"
    "protonvpn"
    "tailscale"
    "ticktick"
    "utm"
    "visual-studio-code"
    "zen-browser"
  ];

  caskArgs = {
    no_quarantine = true;
  };

  masApps = {
    "Copilot Budget" = 1447330651;
  };
};

system.defaults.dock = {
  autohide = true;
  magnification = true;
  show-recents = false;
  wvous-tl-corner = 2; #Top left hot corner to overview (2)
  minimize-to-application = true;
  persistent-apps = [
    "/System/Applications/Launchpad.app"
    "/System/Applications/Messages.app"
    "/Applications/Proton Mail.app"
    "/Applications/Zen Browser.app"
    "/Applications/iTerm.app"
    "/Applications/TickTick.app"
    "/Applications/Obsidian.app"
    "/Applications/Visual Studio Code.app"
    "/Applications/Copilot.app"
  ];
persistent-others = [
    "/Users/justinhunkele/"
    "/Users/justinhunkele/Downloads/"
  ];
};

system.defaults.finder = {
  AppleShowAllExtensions = true;
  AppleShowAllFiles = true;
  FXEnableExtensionChangeWarning = false;
  QuitMenuItem = false;
  ShowPathbar = true;
  ShowStatusBar = true;
  _FXShowPosixPathInTitle = true;
  _FXSortFoldersFirst = true;
  FXPreferredViewStyle = "clmv";
};

system.defaults.LaunchServices = {
  LSQuarantine = false;
};

system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";

system.startup.chime = false;
}