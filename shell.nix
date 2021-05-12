{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;

  # Define specific Erlang AND Elixir verision to install
  elixir = beam.packages.erlangR22.elixir_1_10;
  nodejs = nodejs-14_x;
in

mkShell {
  buildInputs = [ elixir nodejs git postgresql ]
    ++ optional stdenv.isLinux inotify-tools # satisfy phoenix dependency
    ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
      CoreFoundation
      CoreServices
  ]);

  # Put the PostgreSQL databases in the project directory.
  # Put bash aliases here later
  shellHook = ''
    export PGDATA="$PWD/db"
    export PS1='\[\033[1;31m\][\W]λ\[\033[0m\] '
    export PS2='\[\033[1;31m\]|\[\033[0m\] '
    alias mixup="mix phx.server"
  '';
}
