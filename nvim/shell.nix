{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    lua
    lua-language-server
    stylua
  ];

  NVIM_LSP = pkgs.lib.strings.join ":" [
    "nil_ls"
    "lua_ls"
  ];
}
