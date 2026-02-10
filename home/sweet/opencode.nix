# OpenCode AI coding agent configuration
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    opencode
  ];

  # OpenCode main configuration
  xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/config.json";
    plugin = [
      "oh-my-opencode@latest"
    ];
    mcp = {
      nixos = {
        type = "local";
        command = [ "uvx" "mcp-nixos" ];
        enabled = true;
        environment = {
          USE_NIX = "false";
        };
      };
    };
  };

  # Oh-My-OpenCode plugin configuration
  xdg.configFile."opencode/oh-my-opencode.json".text = builtins.toJSON {
    "$schema" = "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json";
    agents = {
      hephaestus.model = "minimax/m2.1-free";
      oracle.model = "minimax/m2.1-free";
      librarian.model = "minimax/m2.1-free";
      explore.model = "minimax/m2.1-free";
      "multimodal-looker".model = "minimax/m2.1-free";
      prometheus.model = "minimax/m2.1-free";
      metis.model = "minimax/m2.1-free";
      momus.model = "minimax/m2.1-free";
      atlas.model = "minimax/m2.1-free";
    };
    categories = {
      "visual-engineering".model = "minimax/m2.1-free";
      ultrabrain.model = "minimax/m2.1-free";
      deep.model = "minimax/m2.1-free";
      artistry.model = "minimax/m2.1-free";
      quick.model = "minimax/m2.1-free";
      "unspecified-low".model = "minimax/m2.1-free";
      "unspecified-high".model = "minimax/m2.1-free";
      writing.model = "minimax/m2.1-free";
    };
  };
}
