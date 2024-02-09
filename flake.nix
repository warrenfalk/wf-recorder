{
  outputs = { self, nixpkgs }:
  let
  pkgs = import nixpkgs { system = "x86_64-linux"; };
  in
  {
    defaultPackage.x86_64-linux = with pkgs; stdenv.mkDerivation {
      name = "wf-recorder";
      version = "git";
      src = ./.;
      nativeBuildInputs = [
        meson
        ninja
        pkg-config
        wayland-scanner
        scdoc
      ];
      buildInputs = [
        git
        cmake
        wayland
        wayland-protocols
        ffmpeg
        x264
        libpulseaudio
        mesa
      ];
    };
  };
}
