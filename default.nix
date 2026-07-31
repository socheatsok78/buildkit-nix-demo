{
  pkgs ? import <nixpkgs> { },
}:
rec {
  hello-layered-image = pkgs.dockerTools.buildLayeredImage {
    name = "hello-layered-image";
    tag = "dev";
    config = {
      Cmd = [ "${pkgs.hello}/bin/hello" ];
    };
  };

  # Set the default package to s6-overlay-container-layered
  default = hello-layered-image;
}
