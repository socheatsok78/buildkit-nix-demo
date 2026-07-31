## About

This is a demo project for showcasing the capabilities of `socheatsok78/buildkit-nix`. It demonstrates how to use BuildKit with Nix Flakes to build container images.

## Example

There are two examples provided in this repository:
- You can build using `docker buildx build` with the provided `flake.nix` file.
- Or alternatively, you can use `docker buildx bake` with the provided `docker-bake.hcl` file.

Here an example of how to build the image using `docker buildx build`:

```bash
# Build the image using the flake.nix file, using "default" package
docker buildx build --file flake.nix --tag demo .

# or, provide an installable package name to build a specific package
docker buildx build --file flake.nix --tag hello-layered-image --target hello-layered-image .
```

Same thing can be done using `docker buildx bake`:

```bash
# Build the image using the docker-bake.hcl file, using "default" package
docker buildx bake

# or, provide an installable package name to build a specific package
docker buildx bake hello-layered-image
```
