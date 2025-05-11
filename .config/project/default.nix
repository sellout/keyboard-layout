{
  config,
  lib,
  ...
}: {
  project = {
    name = "keyboard-layout";
    summary = "Various hardware and software keyboard layouts";
  };

  ## dependency management
  services.renovate.enable = true;

  ## development
  programs = {
    direnv.enable = true;
    # This should default by whether there is a .git file/dir (and whether it’s
    # a file (worktree) or dir determines other things – like where hooks
    # are installed.
    git.enable = true;
  };

  ## formatting
  editorconfig.enable = true;
  programs = {
    treefmt.enable = true;
    vale = {
      enable = true;
      excludes = [
        "*.json"
        "*.keylayout"
        "*.xmodmap"
        "./.github/settings.yml"
      ];
      formatSettings."*"."Microsoft.FirstPerson" = "NO";
      vocab.${config.project.name}.accept = [
        "Configurator"
        "Ergodox"
        "formatter"
        "IBM"
        "Keyboardio"
        "keylayout"
        "Kiibohd"
        "Kinesis"
        "QWERTY"
        "xmodmap"
      ];
    };
  };

  ## CI
  services.garnix.enable = true;

  ## publishing
  services = {
    flakehub.enable = true;
    github = {
      enable = true;
      settings.repository.labels = ["internationalization" "keyboard-layout"];
    };
  };
}
