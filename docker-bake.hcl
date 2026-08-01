target "default" {
    context = "."
    dockerfile = "flake.nix"
    tags = [ "socheatsok78/buildkit-nix-demo:default" ]
}

target "hello-image" {
    context = "."
    target = "hello-image"
    dockerfile = "flake.nix"
    tags = [ "socheatsok78/buildkit-nix-demo:hello-image" ]
}

target "hello-layered-image" {
    context = "."
    target = "hello-layered-image"
    dockerfile = "flake.nix"
    tags = [ "socheatsok78/buildkit-nix-demo:hello-layered-image" ]
}

target "hello-image-with-nix-db" {
    context = "."
    target = "hello-image-with-nix-db"
    dockerfile = "flake.nix"
    tags = [ "socheatsok78/buildkit-nix-demo:hello-image-with-nix-db" ]
}

target "default-multi-platform" {
    context = "."
    dockerfile = "flake.nix"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = [ "socheatsok78/buildkit-nix-demo:multi-platform" ]
}
