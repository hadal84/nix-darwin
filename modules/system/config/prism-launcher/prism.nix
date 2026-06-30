{ inputs, ... }:

let
  themeVariants = [
    "Dark Amethyst"
    "Dark Diamond"
    "Dark Emerald"
    "Light Amethyst"
    "Light Diamond"
    "Light Emerald"
  ];

  themeFiles = builtins.listToAttrs (map (variant: {
    name = "Library/Application Support/PrismLauncher/themes/Ore UI - ${variant}";
    value = { source = "${inputs.prism-oreui}/Ore UI - ${variant}"; };
  }) themeVariants);

in
  {
    home-manager.users.hadal84 = { config, osConfig, ... }: {
      home.file = themeFiles // {
        "Library/Application Support/PrismLauncher/iconthemes/Ore UI - Icon Pack".source = 
        "${inputs.prism-oreui}/Ore UI - Icon Pack";
      };
    };
  }
