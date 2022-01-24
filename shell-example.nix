# shell.nix
{ pkgs ? import <nixpkgs> {} }:
let
  time_series = pkgs.python39;
  python-with-my-packages = time_series.withPackages (p: with p; [
    pandas
    requests
    numpy
    matplotlib
    statsmodels
    scikit-learn
    seaborn
    jupyter
    # other python packages you want
  ]);
in
pkgs.mkShell {
  buildInputs = [
    python-with-my-packages
    # other dependencies
  ];
  shellHook = ''
    PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
    # maybe set more env-vars
  '';
}
