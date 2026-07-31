target "default" {
    context = "."
    dockerfile = "flake.nix"
}

target "hello-layered-image" {
    context = "."
    target = "hello-layered-image"
    dockerfile = "flake.nix"
}
