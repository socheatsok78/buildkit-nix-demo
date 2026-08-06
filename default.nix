{
  pkgs ? import <nixpkgs> { },
}:
rec {
  hello = pkgs.hello;

  hello-image = pkgs.dockerTools.buildImage {
    name = "hello-image";
    tag = "dev";
    copyToRoot = pkgs.buildEnv {
      name = "image-root";
      pathsToLink = [ "/bin" ];
      paths = [ pkgs.hello ];
    };
    config = {
      Cmd = [ "${pkgs.hello}/bin/hello" ];
    };
  };

  hello-layered-image = pkgs.dockerTools.buildLayeredImage {
    name = "hello-layered-image";
    tag = "dev";
    contents = [
      pkgs.hello
    ];
    config = {
      Cmd = [ "${pkgs.hello}/bin/hello" ];
    };
  };

  hello-image-with-nix-db = pkgs.dockerTools.buildImageWithNixDb {
    name = "hello-image-with-nix-db";
    tag = "dev";
  
    copyToRoot = pkgs.buildEnv {
      name = "image-root";
      pathsToLink = [ "/bin" ];
      paths = [
        # nix-store uses cat program to display results as specified by
        # the image env variable NIX_PAGER.
        pkgs.coreutils
        pkgs.nix
        pkgs.bash
        pkgs.hello
      ];
    };

    config = {
      Env = [
        "NIX_PAGER=cat"
        # A user is required by nix
        # https://github.com/NixOS/nix/blob/9348f9291e5d9e4ba3c4347ea1b235640f54fd79/src/libutil/util.cc#L478
        "USER=nobody"
      ];
    };

    config = {
      Cmd = [ "${pkgs.hello}/bin/hello" ];
    };
  };

  # Set the default package to s6-overlay-container-layered
  default = hello-layered-image;
}
