# Build scripts for the EV3 Source image

This repository contains scripts used to build a customised EV3 image containing Sling and Sinter.

If you want to know exactly how the build process works, read the [GitHub workflow](.github/workflows/build.yml).

In a nutshell:

- [`build_sling.sh`](./build_sling.sh): Cross-compiles Sling and Sinter for ARM using ev3dev's cross-compilation Docker image `ev3dev/debian-stretch-cross`, with some additional dependencies added in [`Dockerfile.sling`](./Dockerfile.sling)
- [`build_prompt.sh`](./build_prompt.sh): Cross-compiles the `nus_login` binary to allow for user login to the NUS_STU WiFi network, using ev3dev's cross-compilation Docker image `ev3dev/debian-stretch-armel-cross` with some additional dependencies added in [`Dockerfile.prompt`](./Dockerfile.prompt)
- [`build_qrcode.sh`](./build_qrcode.sh): Cross-compiles the `show_qrcode` binary to display the QR code of the device secret on the EV3 screen
- [`build_uuidtob62.sh](./build_uuidtob62.sh): Cross-compiles the `uuidtob62` CLI utility to represent the device secret in a more compact format
- [`build_image.sh`](./build_image.sh): Builds the EV3 root filesystem using [`image/Dockerfile`](image/Dockerfile) and [`image/bootstrap.sh`](image/bootstrap.sh), and then uses [Brickstrap](https://github.com/ev3dev/brickstrap) to build the final image

To run this locally:

- You must be on Linux.
- You need a static build of QEMU configured for user-mode ARM emulation. It must be registered to handle ARM ELF files using `binfmt_misc`.
- You need libguestfs tools.
- To satisfy the above dependencies:
  - On Ubuntu, install `libguestfs-tools qemu-user-static binfmt-support`.
  - On Arch, install `binfmt-qemu-static qemu-user-static-bin libguestfs`. (Note, the first two are AUR packages.)
- Download [`brickstrap.sh`](https://raw.githubusercontent.com/ev3dev/brickstrap/master/src/brickstrap.sh) to the current directory.
