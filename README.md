# deme-docker

[Chrono DEM-Engine](https://github.com/projectchrono/DEM-Engine) 3.0.19 (GPU discrete element method) with its
Python API (`pip install "deme[cuda12]"`), headless, for rented NVIDIA GPU machines.

Image: `ghcr.io/type-2-labs/deme:3.0.19-cuda12.8` (built by GitHub Actions on every push to `main`).

- Python venv on `PATH`: `import deme`
- Source and Python demos (main branch): `/opt/DEM-Engine/python/demos/`

Needs an NVIDIA driver for CUDA 12.8 or newer on the host. The first run compiles CUDA kernels (NVRTC).
