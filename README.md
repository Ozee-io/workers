<img src="https://www.ozee.io/logos/vector/Ozee_logo_2c.svg" alt="drawing" width="200"/>

# Remote Workers
This repository contains scripts to create and manage the remote workers used by Ozee for execution.

These images are rebuilt weekly off the latest alpine base image to ensure secure base images.

These images are deliberately simple to reduce exposure. Only the latest terraform patch version is maintained for each image. Templates consuming these images should never lock the patch version of the underlying image or risk jobs breaking. i.e:
- Supported: >~ 1.2
- Unsupported: == 1.2.3 

# Docker Repository
These images are published to:
- ghcr.io/ozee.io/