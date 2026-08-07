{
  config,
  pkgs,
  selfPath,
  ...
}:

{
  home-manager.users.hadal84 =
    { config, osConfig, ... }:
    {
      home.file.".config/clang/clang++.cfg".source =
        config.lib.file.mkOutOfStoreSymlink "${selfPath}/modules/system/config/clang/clang++.cfg";
    };
}
