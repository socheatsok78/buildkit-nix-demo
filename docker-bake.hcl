group "default" {
  targets = ["flake-default"]
}

target "default-multi-platform" {
    context = "."
    dockerfile = "flake.nix"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = [ "socheatsok78/buildkit-nix-demo:multi-platform" ]
}

target "flake-default" {
    context = "."
    target = "hello-image"
    dockerfile = "flake.nix"
    tags = [ "socheatsok78/buildkit-nix-demo:hello-image" ]
}

target "flake-hello-image" {
    context = "."
    target = "hello-image"
    dockerfile = "flake.nix"
    tags = [ "socheatsok78/buildkit-nix-demo:hello-image" ]
}

target "flake-hello-layered-image" {
    context = "."
    target = "hello-layered-image"
    dockerfile = "flake.nix"
    tags = [ "socheatsok78/buildkit-nix-demo:hello-layered-image" ]
}

target "flake-hello-image-with-nix-db" {
    context = "."
    target = "hello-image-with-nix-db"
    dockerfile = "flake.nix"
    tags = [ "socheatsok78/buildkit-nix-demo:hello-image-with-nix-db" ]
}


target "reference" {
    dockerfile = "reference.Dockerfile"
    contexts = {
        flake = "target:flake-default"
    }
}
