{
  lib,

  vimPlugins,

  fd,
  fzf,
  ripgrep,
  color-lsp,

  wrapNeovim,

  anvimPlugins,
  neovim-unwrapped,
  basePackage ? neovim-unwrapped,
  anvimVersion ? "unstable",
}:
let
  inherit (lib)
    pipe
    isDerivation
    flatten
    attrValues
    filter
    partition
    ;

  partionPlugins =
    plugins:
    let
      parts = partition (e: e.passthru.start or false) plugins;
    in
    {
      start = parts.right;
      opt = parts.wrong;
    };

  patrionedPlugins = pipe anvimPlugins [
    attrValues
    (filter isDerivation)
    partionPlugins
  ];
in
wrapNeovim {
  pname = "anvim";
  versionSuffix = anvimVersion;

  userConfig = ../../config;

  inherit basePackage;

  startPlugins = flatten [
    patrionedPlugins.start
    vimPlugins.nvim-lspconfig
  ];

  optPlugins =
    with vimPlugins;
    flatten [
      patrionedPlugins.opt

      lualine-nvim
      blink-cmp

      indent-blankline-nvim

      mini-icons
      mini-diff
      mini-pairs

      (cord-nvim.overrideAttrs { doCheck = false; })

      jule-nvim
    ];

  extraPackages = [
    fd
    fzf
    ripgrep
    color-lsp
  ];
}
