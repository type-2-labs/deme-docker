# Chrono DEM-Engine (GPU discrete element method), Python API, headless, for rented NVIDIA machines.
FROM nvidia/cuda:12.8.1-runtime-ubuntu24.04

ARG DEME_VERSION=3.0.19
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3 python3-venv python3-dev git ca-certificates openssh-server rsync wget \
    && rm -rf /var/lib/apt/lists/*

ENV VIRTUAL_ENV=/opt/venv PATH=/opt/venv/bin:${PATH}
RUN python3 -m venv /opt/venv \
    && pip install --no-cache-dir "deme[cuda12]==${DEME_VERSION}" numpy \
    # v3 is released on PyPI but not tagged on GitHub; its demos live on main
    && git clone --depth 1 https://github.com/projectchrono/DEM-Engine.git /opt/DEM-Engine \
    # importing deme needs libcuda (the host driver), which the build runner doesn't have
    && python -c "import importlib.util, importlib.metadata as m; assert importlib.util.find_spec('deme'); print('deme', m.version('deme'))"

WORKDIR /workspace
