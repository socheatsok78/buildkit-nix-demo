## About

This is a demo project for showcasing the capabilities of `socheatsok78/buildkit-nix`. It demonstrates how to use BuildKit with Nix Flakes to build container images.

See [socheatsok78/buildkit-nix](https://github.com/socheatsok78/buildkit-nix) for implementation details.

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

## Sample

Here is a sample output of the `hello-layered-image` image:

```bash
$ docker buildx bake hello-layered-image
```

Output:

```log
#0 building with "default-builder" instance using docker-container driver

#1 [internal] load local bake definitions
#1 reading docker-bake.hcl 858B / 858B done
#1 DONE 0.0s

#2 [internal] load build definition from flake.nix
#2 transferring dockerfile: 813B done
#2 DONE 0.0s

#3 resolve image config for docker-image://ghcr.io/socheatsok78/buildkit-nix:experimental
#3 ...

#4 [auth] socheatsok78/buildkit-nix:pull token for ghcr.io
#4 DONE 0.0s

#3 resolve image config for docker-image://ghcr.io/socheatsok78/buildkit-nix:experimental
#3 DONE 1.4s

#5 docker-image://ghcr.io/socheatsok78/buildkit-nix:experimental@sha256:833fe9582502d252c462efae03433a172a42409f465915163b9f1e78f4b6214e
#5 resolve ghcr.io/socheatsok78/buildkit-nix:experimental@sha256:833fe9582502d252c462efae03433a172a42409f465915163b9f1e78f4b6214e done
#5 CACHED

#6 resolve image config for docker-image://docker.io/nixos/nix:latest
#6 DONE 1.1s

#7 [internal] load source from build context
#7 DONE 0.0s

#8 [nix] load builder image from docker.io/nixos/nix:latest
#8 resolve docker.io/nixos/nix:latest
#8 resolve docker.io/nixos/nix:latest 0.4s done
#8 CACHED

#7 [internal] load source from build context
#7 transferring context: 8.04kB 0.0s done
#7 DONE 0.0s

#9 [nix] nix build .#hello-layered-image
#9 0.666 copying path '/nix/store/lj0fr41wwbrx2mwq2378jg8qrns7b93d-source' from 'https://cache.nixos.org'...
#9 25.15 these 11 derivations will be built:
#9 25.15   /nix/store/r7rg5pd4k86a06gr01ig1q514yl2syi5-pythoncheck.sh.drv
#9 25.15   /nix/store/9ybg16xqgzvnvhfijm2509jq7rgjjsjd-pythoncheck.sh.drv
#9 25.15   /nix/store/l3qz0ybs72257hhp4s258mbf22am6b7x-stream.drv
#9 25.15   /nix/store/b4q7gsvy2jn6i3ccjxqvbb3mikx4pg0q-stream.drv
#9 25.15   /nix/store/8q02yvc2ipqkafr8zj348ci8rsa42dl8-hello-layered-image-base.json.drv
#9 25.15   /nix/store/sjp3fpfvfh1f7r6lln7j1376bn9gizhf-hello-layered-image-customisation-layer.drv
#9 25.15   /nix/store/p948i34j4lbzh333qxlsghrvnf72fywz-excludePaths.drv
#9 25.15   /nix/store/8azx81nwnsb19ry9nm2ybxqs4z8mdnjw-layers.json.drv
#9 25.15   /nix/store/qwk3wkir6wyc48v47zpfq2qrfy52aflp-hello-layered-image-conf.json.drv
#9 25.15   /nix/store/31nhcnpkqaqq9y9lpay7hhng0qbjbm1k-stream-hello-layered-image.drv
#9 25.15   /nix/store/lncn6zswxanmk6n3zf4fd1p4xvq0i7wz-hello-layered-image.tar.gz.drv
#9 25.15 these 76 paths will be fetched (184.4 MiB download, 565.9 MiB unpacked):
#9 25.15   /nix/store/sdxy09826yspmrb4wcvjsgw5kly2i2wv-acl-2.4.0
#9 25.15   /nix/store/hsdi3snla9kwadar880ni9kvi1km08b7-attr-2.6.0
#9 25.15   /nix/store/8m76s9lqyh1if0vi3vrg6rwc2jl9lbrk-bash-5.3p15
#9 25.15   /nix/store/ish1bk0q1b1c4hgdg7swr102p4rfn4az-binutils-2.46
#9 25.15   /nix/store/l193kgbn2rvr0zf5hdcsm81mzgv9v4sd-binutils-2.46-lib
#9 25.15   /nix/store/wz4n54b22p6zspin8wq2cdicb7li5mg1-binutils-wrapper-2.46
#9 25.15   /nix/store/kg4vffmclz884v6axn98jn2kf3sps6nh-bzip2-1.0.8
#9 25.15   /nix/store/nflz3bd12vmz1nl6jqzimxpww83s6zy0-bzip2-1.0.8-bin
#9 25.15   /nix/store/3da6dbbp462hxhhxxrlilv3022fn2mc5-coreutils-9.11
#9 25.15   /nix/store/xq857wl7ynr4d23087qlczdjd5k6ryqk-dash-0.5.13.4
#9 25.15   /nix/store/2vhzyybabxsrc9sjqdc6xfvnnnkj1zl0-die-hook
#9 25.15   /nix/store/x8g3g61rd0z3yf4imk1jgg76rmnf2hy6-diffutils-3.12
#9 25.15   /nix/store/y3i7ay29k7bxm5x1pc84j8kd09lxk75s-ed-1.22.5
#9 25.15   /nix/store/cii8mazmi74vsj6nshkcq33bd0dcnnyw-expand-response-params
#9 25.15   /nix/store/fz0nvrqb8wwxgxvfc8hg9iwg4183achg-expat-2.8.2
#9 25.15   /nix/store/f80zjkx1am8h1s293d5vgmccbg8wbkaz-fakeroot-1.38.1
#9 25.15   /nix/store/kfy82pbh5pngg08b0hbk8n9hisf3y4iz-file-5.48
#9 25.15   /nix/store/47s1v9jk5hp88jwkkad6fzsyzq4hasla-findutils-4.10.0
#9 25.15   /nix/store/wif7grdd7v18kjcfmj1h8dqnilc8kpq9-gawk-5.4.1
#9 25.15   /nix/store/jq52hfnmkaa7bby07a4d7lblky6w27fg-gcc-15.3.0
#9 25.15   /nix/store/acydkjgciry45a32qfsl1fi2vnpbhn1x-gcc-15.3.0-lib
#9 25.15   /nix/store/4mkfd0wwj77317npdgkcgw8j4hkgqgaa-gcc-15.3.0-libgcc
#9 25.15   /nix/store/hy2xqdbh7mw1w1yhqggfb3s1dmf89h10-gcc-wrapper-15.3.0
#9 25.15   /nix/store/0rc63yj6yf4d5bs8jhmb5hd13z13v4lq-gdbm-1.26-lib
#9 25.15   /nix/store/zlgb5h1fr9dczdvs1pn2vj42a0pq6jm0-getopt-1.1.6
#9 25.15   /nix/store/cj4jysawj8cc6yv2cwdgzxhdhq7dnf05-glibc-2.42-67
#9 25.15   /nix/store/q5ri05084kljgybirp8djd6hll18s836-glibc-2.42-67-bin
#9 25.15   /nix/store/nnac0fcjj944l3wzzfaj1fxw506q7gk5-glibc-2.42-67-dev
#9 25.15   /nix/store/vn2lm8ra7rx4dcbnzrglhq0prfjdk68f-gmp-6.3.0
#9 25.15   /nix/store/amxnl9n6777kk1z80p4zrizmrnd8wpnn-gmp-with-cxx-6.3.0
#9 25.15   /nix/store/wfl3vmszs5a8c4wcyqb2x185h5d43f4x-gnu-config-2024-01-01
#9 25.15   /nix/store/2nh6fi7n4kx8h6d85gql22w6x13mlb5y-gnugrep-3.12
#9 25.15   /nix/store/63y5lhh3znhwykj728ddm147dn1z6j0v-gnumake-4.4.1
#9 25.15   /nix/store/8zwgd7pg8pyg7gnsq2l989pqbs29s3jv-gnused-4.10
#9 25.15   /nix/store/70ivc6x17f87d6np4k6qkaqvv7k4l37h-gnutar-1.35
#9 25.15   /nix/store/064nqn0kfcgxr1v30m9ym8cz3zyy58as-gzip-1.14
#9 25.15   /nix/store/cmgcrp6v3ywyq0b5a4faaqi9ffp91bjy-hello-2.12.3
#9 25.15   /nix/store/8z7zdk4s2azjycckm6hgd8hxnzw9xpla-isl-0.20
#9 25.15   /nix/store/97hmn17vbpx0l0wbi4jc6hwr3pyy2zz3-jq-1.8.2
#9 25.15   /nix/store/l18as28b4wwqds62yqci9l8xhhdhf78l-jq-1.8.2-bin
#9 25.15   /nix/store/n82y4hrj0kzw66q0c630r72a2vkf21p8-jq-1.8.2-dev
#9 25.15   /nix/store/jhskzlqjd14dg6s43dbg5vzzmhb8inf9-libedit-20260508-3.1
#9 25.15   /nix/store/k70agyb5r9isnaf093zac5lv3c3qgfsv-libffi-3.7.0
#9 25.15   /nix/store/qlmazqi9rqlg4b1gbw5qj2v8pwd9bl39-libidn2-2.3.8
#9 25.15   /nix/store/cm1pz3kjbvgni6g76qsa97j0qc2jhkk0-libmpc-1.4.1
#9 25.15   /nix/store/qr7qvicd9q4lnq6lznx223z5sakp9jrx-libunistring-1.4.2
#9 25.15   /nix/store/nczp4i9gmad2wqbi02hwxpxz7wng49zc-linux-headers-7.0
#9 25.15   /nix/store/3m5rr4k64y0az843h1f4l0rzscayzyd1-lndir-1.0.5
#9 25.15   /nix/store/n9q8vil0p5210fdary3y1wjc3k4sxbpb-mailcap-2.1.54
#9 25.15   /nix/store/a12x75lbhfn4ndyg31mi7m9a76x8b7qi-make-binary-wrapper-hook
#9 25.15   /nix/store/0w58qq3q3h24ihg1fxfc0synx2wqkh78-make-shell-wrapper-hook
#9 25.15   /nix/store/4mg1llcz6ypprv5azlfyyyci7y86frzw-mpdecimal-4.0.1
#9 25.15   /nix/store/clna21s6cvlyrcf04kzial1arcjpcclk-mpfr-4.2.2
#9 25.15   /nix/store/vp9dqx8xijcl8s7mk4gxc1wars7haggv-ncurses-6.6
#9 25.15   /nix/store/y5im06y69n3ia0dwa5abp2g5nfm8gjib-oniguruma-6.9.10-lib
#9 25.15   /nix/store/8bgbdy11yxki9v7lpvcpnk12f6qw1bm5-openssl-3.6.3
#9 25.15   /nix/store/9zwv67xx564krb1bnj6knqydii7am5ja-patch-2.8
#9 25.15   /nix/store/5qhkb82f8h891kv8894b2p1fa1myxw6v-patchelf-0.15.2
#9 25.15   /nix/store/ram5l4y2vhi4jhwfxg1a605cjm7h9ynv-pcre2-10.47
#9 25.15   /nix/store/xl2jgmypa1x46l5adgmpqip09f2j51jv-pigz-2.8
#9 25.15   /nix/store/ymm5c1kb7p2r6331bgcdxijayqhcbvqy-python3-3.14.6
#9 25.15   /nix/store/lqmvcm7lpd8b8liwb50dj30jwbh3kb1r-python3.14-flake8-7.3.0
#9 25.15   /nix/store/psn20cspqr597m109i59dwd01s9776l3-python3.14-mccabe-0.7.0
#9 25.15   /nix/store/i3x22rcw0029dawgh4p0kprn3pv98gmk-python3.14-pycodestyle-2.14.0
#9 25.15   /nix/store/vasnp3mmyp9adwn9d0lnd82jmzl1wz6w-python3.14-pyflakes-3.4.0
#9 25.15   /nix/store/ggy1dmcp6pv2a0z11v7zlanzpphv4hgw-readline-8.3p3
#9 25.15   /nix/store/ljydz8slckh7xjglwz1bp86ccbpmjp5y-sqlite-3.53.3
#9 25.15   /nix/store/j93snd8gdy1l4p87n1v4wzipp8w2m0sx-stdenv-linux-no-cc
#9 25.15   /nix/store/libxpcnlz30x6fpm8bx9vwnx4vp0vv9x-tzdata-2026b
#9 25.15   /nix/store/39n4cxlc24k6bv0r88sl6jhyqigzk1zj-update-autotools-gnu-config-scripts-hook
#9 25.15   /nix/store/akmp3ffxi0mlz8r1f0v9p3vwxlanpqnh-util-linux-minimal-2.42.2-lib
#9 25.15   /nix/store/84i6rp3qvbrm0vl88w5fm9h37yka5mzb-xgcc-15.3.0-libgcc
#9 25.15   /nix/store/6740pvx8gps1jcf9iswby5xjf0s46dgr-xz-5.8.3
#9 25.15   /nix/store/w2ln6m0fawzpisz28jmqdvdrqdzlszyb-xz-5.8.3-bin
#9 25.15   /nix/store/rh98aa25qymry73whnday323sl78082m-zlib-1.3.2
#9 25.15   /nix/store/i7pqrwnhnifdypwfdvkjgn9g3np170j3-zstd-1.5.7
#9 25.16 copying path '/nix/store/2vhzyybabxsrc9sjqdc6xfvnnnkj1zl0-die-hook' from 'https://cache.nixos.org'...
#9 25.16 copying path '/nix/store/wfl3vmszs5a8c4wcyqb2x185h5d43f4x-gnu-config-2024-01-01' from 'https://cache.nixos.org'...
#9 25.16 copying path '/nix/store/n9q8vil0p5210fdary3y1wjc3k4sxbpb-mailcap-2.1.54' from 'https://cache.nixos.org'...
#9 25.16 copying path '/nix/store/libxpcnlz30x6fpm8bx9vwnx4vp0vv9x-tzdata-2026b' from 'https://cache.nixos.org'...
#9 25.17 copying path '/nix/store/84i6rp3qvbrm0vl88w5fm9h37yka5mzb-xgcc-15.3.0-libgcc' from 'https://cache.nixos.org'...
#9 25.17 copying path '/nix/store/qr7qvicd9q4lnq6lznx223z5sakp9jrx-libunistring-1.4.2' from 'https://cache.nixos.org'...
#9 25.18 copying path '/nix/store/nczp4i9gmad2wqbi02hwxpxz7wng49zc-linux-headers-7.0' from 'https://cache.nixos.org'...
#9 25.21 copying path '/nix/store/4mkfd0wwj77317npdgkcgw8j4hkgqgaa-gcc-15.3.0-libgcc' from 'https://cache.nixos.org'...
#9 26.16 copying path '/nix/store/qlmazqi9rqlg4b1gbw5qj2v8pwd9bl39-libidn2-2.3.8' from 'https://cache.nixos.org'...
#9 26.42 copying path '/nix/store/39n4cxlc24k6bv0r88sl6jhyqigzk1zj-update-autotools-gnu-config-scripts-hook' from 'https://cache.nixos.org'...
#9 26.63 copying path '/nix/store/cj4jysawj8cc6yv2cwdgzxhdhq7dnf05-glibc-2.42-67' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/sdxy09826yspmrb4wcvjsgw5kly2i2wv-acl-2.4.0' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/hsdi3snla9kwadar880ni9kvi1km08b7-attr-2.6.0' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/8m76s9lqyh1if0vi3vrg6rwc2jl9lbrk-bash-5.3p15' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/kg4vffmclz884v6axn98jn2kf3sps6nh-bzip2-1.0.8' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/y3i7ay29k7bxm5x1pc84j8kd09lxk75s-ed-1.22.5' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/cii8mazmi74vsj6nshkcq33bd0dcnnyw-expand-response-params' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/fz0nvrqb8wwxgxvfc8hg9iwg4183achg-expat-2.8.2' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/wif7grdd7v18kjcfmj1h8dqnilc8kpq9-gawk-5.4.1' from 'https://cache.nixos.org'...
#9 29.38 copying path '/nix/store/acydkjgciry45a32qfsl1fi2vnpbhn1x-gcc-15.3.0-lib' from 'https://cache.nixos.org'...
#9 29.39 copying path '/nix/store/zlgb5h1fr9dczdvs1pn2vj42a0pq6jm0-getopt-1.1.6' from 'https://cache.nixos.org'...
#9 29.39 copying path '/nix/store/0rc63yj6yf4d5bs8jhmb5hd13z13v4lq-gdbm-1.26-lib' from 'https://cache.nixos.org'...
#9 29.39 copying path '/nix/store/q5ri05084kljgybirp8djd6hll18s836-glibc-2.42-67-bin' from 'https://cache.nixos.org'...
#9 29.39 copying path '/nix/store/vn2lm8ra7rx4dcbnzrglhq0prfjdk68f-gmp-6.3.0' from 'https://cache.nixos.org'...
#9 29.39 copying path '/nix/store/8zwgd7pg8pyg7gnsq2l989pqbs29s3jv-gnused-4.10' from 'https://cache.nixos.org'...
#9 29.39 copying path '/nix/store/cmgcrp6v3ywyq0b5a4faaqi9ffp91bjy-hello-2.12.3' from 'https://cache.nixos.org'...
#9 29.39 copying path '/nix/store/63y5lhh3znhwykj728ddm147dn1z6j0v-gnumake-4.4.1' from 'https://cache.nixos.org'...
#9 29.52 copying path '/nix/store/rh98aa25qymry73whnday323sl78082m-zlib-1.3.2' from 'https://cache.nixos.org'...
#9 29.52 copying path '/nix/store/4mg1llcz6ypprv5azlfyyyci7y86frzw-mpdecimal-4.0.1' from 'https://cache.nixos.org'...
#9 29.52 copying path '/nix/store/ram5l4y2vhi4jhwfxg1a605cjm7h9ynv-pcre2-10.47' from 'https://cache.nixos.org'...
#9 29.53 copying path '/nix/store/nflz3bd12vmz1nl6jqzimxpww83s6zy0-bzip2-1.0.8-bin' from 'https://cache.nixos.org'...
#9 29.69 copying path '/nix/store/6740pvx8gps1jcf9iswby5xjf0s46dgr-xz-5.8.3' from 'https://cache.nixos.org'...
#9 29.77 copying path '/nix/store/8bgbdy11yxki9v7lpvcpnk12f6qw1bm5-openssl-3.6.3' from 'https://cache.nixos.org'...
#9 29.80 copying path '/nix/store/akmp3ffxi0mlz8r1f0v9p3vwxlanpqnh-util-linux-minimal-2.42.2-lib' from 'https://cache.nixos.org'...
#9 29.81 copying path '/nix/store/k70agyb5r9isnaf093zac5lv3c3qgfsv-libffi-3.7.0' from 'https://cache.nixos.org'...
#9 29.82 copying path '/nix/store/70ivc6x17f87d6np4k6qkaqvv7k4l37h-gnutar-1.35' from 'https://cache.nixos.org'...
#9 29.84 copying path '/nix/store/9zwv67xx564krb1bnj6knqydii7am5ja-patch-2.8' from 'https://cache.nixos.org'...
#9 29.90 copying path '/nix/store/vp9dqx8xijcl8s7mk4gxc1wars7haggv-ncurses-6.6' from 'https://cache.nixos.org'...
#9 30.05 copying path '/nix/store/064nqn0kfcgxr1v30m9ym8cz3zyy58as-gzip-1.14' from 'https://cache.nixos.org'...
#9 30.10 copying path '/nix/store/0w58qq3q3h24ihg1fxfc0synx2wqkh78-make-shell-wrapper-hook' from 'https://cache.nixos.org'...
#9 30.16 copying path '/nix/store/3m5rr4k64y0az843h1f4l0rzscayzyd1-lndir-1.0.5' from 'https://cache.nixos.org'...
#9 30.21 copying path '/nix/store/y5im06y69n3ia0dwa5abp2g5nfm8gjib-oniguruma-6.9.10-lib' from 'https://cache.nixos.org'...
#9 30.21 copying path '/nix/store/xl2jgmypa1x46l5adgmpqip09f2j51jv-pigz-2.8' from 'https://cache.nixos.org'...
#9 30.25 copying path '/nix/store/kfy82pbh5pngg08b0hbk8n9hisf3y4iz-file-5.48' from 'https://cache.nixos.org'...
#9 30.37 copying path '/nix/store/ljydz8slckh7xjglwz1bp86ccbpmjp5y-sqlite-3.53.3' from 'https://cache.nixos.org'...
#9 30.39 copying path '/nix/store/8z7zdk4s2azjycckm6hgd8hxnzw9xpla-isl-0.20' from 'https://cache.nixos.org'...
#9 30.40 copying path '/nix/store/nnac0fcjj944l3wzzfaj1fxw506q7gk5-glibc-2.42-67-dev' from 'https://cache.nixos.org'...
#9 30.56 copying path '/nix/store/w2ln6m0fawzpisz28jmqdvdrqdzlszyb-xz-5.8.3-bin' from 'https://cache.nixos.org'...
#9 30.68 copying path '/nix/store/clna21s6cvlyrcf04kzial1arcjpcclk-mpfr-4.2.2' from 'https://cache.nixos.org'...
#9 30.68 copying path '/nix/store/l193kgbn2rvr0zf5hdcsm81mzgv9v4sd-binutils-2.46-lib' from 'https://cache.nixos.org'...
#9 30.69 copying path '/nix/store/2nh6fi7n4kx8h6d85gql22w6x13mlb5y-gnugrep-3.12' from 'https://cache.nixos.org'...
#9 31.08 copying path '/nix/store/97hmn17vbpx0l0wbi4jc6hwr3pyy2zz3-jq-1.8.2' from 'https://cache.nixos.org'...
#9 31.56 copying path '/nix/store/jhskzlqjd14dg6s43dbg5vzzmhb8inf9-libedit-20260508-3.1' from 'https://cache.nixos.org'...
#9 31.56 copying path '/nix/store/ggy1dmcp6pv2a0z11v7zlanzpphv4hgw-readline-8.3p3' from 'https://cache.nixos.org'...
#9 32.03 copying path '/nix/store/cm1pz3kjbvgni6g76qsa97j0qc2jhkk0-libmpc-1.4.1' from 'https://cache.nixos.org'...
#9 32.13 copying path '/nix/store/l18as28b4wwqds62yqci9l8xhhdhf78l-jq-1.8.2-bin' from 'https://cache.nixos.org'...
#9 32.49 copying path '/nix/store/xq857wl7ynr4d23087qlczdjd5k6ryqk-dash-0.5.13.4' from 'https://cache.nixos.org'...
#9 32.91 copying path '/nix/store/n82y4hrj0kzw66q0c630r72a2vkf21p8-jq-1.8.2-dev' from 'https://cache.nixos.org'...
#9 33.37 copying path '/nix/store/ish1bk0q1b1c4hgdg7swr102p4rfn4az-binutils-2.46' from 'https://cache.nixos.org'...
#9 33.37 copying path '/nix/store/amxnl9n6777kk1z80p4zrizmrnd8wpnn-gmp-with-cxx-6.3.0' from 'https://cache.nixos.org'...
#9 33.37 copying path '/nix/store/jq52hfnmkaa7bby07a4d7lblky6w27fg-gcc-15.3.0' from 'https://cache.nixos.org'...
#9 33.37 copying path '/nix/store/5qhkb82f8h891kv8894b2p1fa1myxw6v-patchelf-0.15.2' from 'https://cache.nixos.org'...
#9 33.37 copying path '/nix/store/i7pqrwnhnifdypwfdvkjgn9g3np170j3-zstd-1.5.7' from 'https://cache.nixos.org'...
#9 33.86 copying path '/nix/store/3da6dbbp462hxhhxxrlilv3022fn2mc5-coreutils-9.11' from 'https://cache.nixos.org'...
#9 34.32 copying path '/nix/store/ymm5c1kb7p2r6331bgcdxijayqhcbvqy-python3-3.14.6' from 'https://cache.nixos.org'...
#9 35.10 copying path '/nix/store/x8g3g61rd0z3yf4imk1jgg76rmnf2hy6-diffutils-3.12' from 'https://cache.nixos.org'...
#9 35.10 copying path '/nix/store/f80zjkx1am8h1s293d5vgmccbg8wbkaz-fakeroot-1.38.1' from 'https://cache.nixos.org'...
#9 35.10 copying path '/nix/store/47s1v9jk5hp88jwkkad6fzsyzq4hasla-findutils-4.10.0' from 'https://cache.nixos.org'...
#9 36.23 copying path '/nix/store/j93snd8gdy1l4p87n1v4wzipp8w2m0sx-stdenv-linux-no-cc' from 'https://cache.nixos.org'...
#9 37.03 building '/nix/store/8q02yvc2ipqkafr8zj348ci8rsa42dl8-hello-layered-image-base.json.drv'...
#9 37.07 building '/nix/store/sjp3fpfvfh1f7r6lln7j1376bn9gizhf-hello-layered-image-customisation-layer.drv'...
#9 37.21 building '/nix/store/p948i34j4lbzh333qxlsghrvnf72fywz-excludePaths.drv'...
#9 39.69 copying path '/nix/store/wz4n54b22p6zspin8wq2cdicb7li5mg1-binutils-wrapper-2.46' from 'https://cache.nixos.org'...
#9 64.48 copying path '/nix/store/psn20cspqr597m109i59dwd01s9776l3-python3.14-mccabe-0.7.0' from 'https://cache.nixos.org'...
#9 64.48 copying path '/nix/store/i3x22rcw0029dawgh4p0kprn3pv98gmk-python3.14-pycodestyle-2.14.0' from 'https://cache.nixos.org'...
#9 64.48 copying path '/nix/store/vasnp3mmyp9adwn9d0lnd82jmzl1wz6w-python3.14-pyflakes-3.4.0' from 'https://cache.nixos.org'...
#9 64.64 building '/nix/store/8azx81nwnsb19ry9nm2ybxqs4z8mdnjw-layers.json.drv'...
#9 64.90 building '/nix/store/qwk3wkir6wyc48v47zpfq2qrfy52aflp-hello-layered-image-conf.json.drv'...
#9 65.96 copying path '/nix/store/lqmvcm7lpd8b8liwb50dj30jwbh3kb1r-python3.14-flake8-7.3.0' from 'https://cache.nixos.org'...
#9 71.77 copying path '/nix/store/hy2xqdbh7mw1w1yhqggfb3s1dmf89h10-gcc-wrapper-15.3.0' from 'https://cache.nixos.org'...
#9 71.83 copying path '/nix/store/a12x75lbhfn4ndyg31mi7m9a76x8b7qi-make-binary-wrapper-hook' from 'https://cache.nixos.org'...
#9 71.99 building '/nix/store/r7rg5pd4k86a06gr01ig1q514yl2syi5-pythoncheck.sh.drv'...
#9 72.03 building '/nix/store/9ybg16xqgzvnvhfijm2509jq7rgjjsjd-pythoncheck.sh.drv'...
#9 72.06 building '/nix/store/l3qz0ybs72257hhp4s258mbf22am6b7x-stream.drv'...
#9 72.29 building '/nix/store/b4q7gsvy2jn6i3ccjxqvbb3mikx4pg0q-stream.drv'...
#9 72.32 building '/nix/store/31nhcnpkqaqq9y9lpay7hhng0qbjbm1k-stream-hello-layered-image.drv'...
#9 72.35 building '/nix/store/lncn6zswxanmk6n3zf4fd1p4xvq0i7wz-hello-layered-image.tar.gz.drv'...
#9 DONE 75.5s

#10 [nix] extracting result layers
#10 DONE 0.3s

#11 [nix] importing layer: 11b20d58793b56e53c75702599cf791d8b20c37c79a99b32959fbd15e55b441e/layer.tar
#11 CACHED

#12 [nix] importing layer: 927c315cb7e40e033795428757709329018e494581a6aab6e535dc1f77b1c9ca/layer.tar
#12 CACHED

#13 [nix] importing layer: 5f2169e9e437bcfc85092cb37cf3f054c9753c5aaf63b6c9a3d6c0408f61bc92/layer.tar
#13 CACHED

#14 [nix] importing layer: 9bcb140a5c2a7bd5b9db86fc461ce5853af474cb5de34943539a69292111fa30/layer.tar
#14 CACHED

#15 [nix] importing layer: 7047656e73c1b325425bd8b9ab38e9dbf61cd9c97718994b45239de43fc4defe/layer.tar
#15 CACHED

#16 [nix] importing layer: 5c59eeae6f9e7d2e2524fa8e9cb4916a91f67c77dd8abbfa26ef45aae5cfb682/layer.tar
#16 DONE 0.0s

#17 CACHED

#18 exporting to docker image format
#18 exporting layers 0.0s done
#18 exporting manifest sha256:2d7fe04118c54dfa8b01acc5d8d5f0fbe9b2f83b1f23d5ebe53e6f8256b2b1d2 done
#18 exporting config sha256:c7f749e76f2fccfdd18700a86cc812c5b842cae83db4fbb76aeca3136819f521 done
#18 sending tarball
#18 sending tarball 0.9s done
#18 DONE 1.0s

#19 importing to docker
#19 loading layer 744170979f3b 74.23kB / 74.23kB 0.7s done
#19 loading layer 08a55010a22b 816.88kB / 816.88kB 0.6s done
#19 loading layer 9ae6225e73f3 139.51kB / 139.51kB 0.6s done
#19 loading layer b5bb90e7f23e 12.49MB / 12.49MB 0.6s done
#19 loading layer 8611a80db592 76.91kB / 76.91kB 0.1s done
#19 loading layer ff5ca4152cae 1.77kB / 1.77kB 0.0s done
#19 DONE 0.7s
```
