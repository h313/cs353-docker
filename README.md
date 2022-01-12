# CSCI 353 Networking Docker Image

<a href="https://hub.docker.com/repository/docker/h313/cs353-docker">
  <img align="left" src="https://img.shields.io/docker/image-size/h313/cs353-docker?style=flat-square" />
</a>

<a href="https://hub.docker.com/repository/docker/h313/cs353-docker">
  <img align="left" src="https://img.shields.io/docker/pulls/h313/cs353-docker" />
</a>

<br>

- [CSCI 353 Docker Image](#csci-353-networking-docker-image)
  - [Intro](#intro)
    - [Supported Platforms](#supported-platforms)
    - [Recommended Editors](#recommended-editors)
  - [Getting Started](#getting-started)
    - [Set Up](#set-up)
    - [Running](#running)
    - [Working in the Environment](#working-in-the-environment)
    - [Exiting the Environment](#exiting-the-environment)
    - [Stopping](#stopping)
  - [System Requirements](#system-requirements)

## Intro

This repo setups a simple dev environment for CSCI 353 projects with Docker.
After pulling the Docker image from Docker Hub, you should be able to use the
`run.sh` or `run.ps1` script to start, stop, and work in a virtualized
environment all from your command line.

This repo is also based off of [Cameron Durham's](https://github.com/camerondurham/)
[cs350-docker](https://github.com/camerondurham/cs350-docker) project.

### Supported Platforms

This Docker image has been tested and verified to be functioning correctly on the following platforms:

- Debian Sid, CentOS 8, Arch Linux

Please help me add more as you try them out by submitting a PR or an issue!

### Recommended Editors

- Visual Studio Code with the [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
- JetBrains CLion with the [Makefile](https://plugins.jetbrains.com/plugin/9333-makefile-language) extension or CMake integration
- NeoVim with [coc.nvim](https://github.com/neoclide/coc.nvim) and extra patience

## Getting Started

The instructions below will walk you through running the setup script and the run script you'll use to access the csci350 environment.

### Set Up

1. **Install Docker** desktop from [the website](https://www.docker.com/products/docker-desktop)

   - **Windows Users Only**: Docker provides better performance using **WSL 2** than legacy Hyper-V. Set up WSL 2 using Microsoft's guide [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10#manual-installation-steps). After you have WSL 2 running, refer to the screenshots at the end of this readme for settings you have to enable in Docker Desktop app.
   - **Linux Users Only**: Install Docker engine from [here](https://docs.docker.com/engine/install/), and Docker Compose from [here](https://docs.docker.com/compose/install/)

2. **Clone this repository**.

3. Specify your desired mount location (i.e. your `xv6` project folder)

**Windows users only**

Make sure you run this in an Admin PowerShell to let you run scripts:

```powershell
# must execute this in admin powershell and select [A] to run scripts
Set-ExecutionPolicy RemoteSigned
```

### Running

1. Modify the `work` variable at the top of the run script in the project folder.
   For example:

   **macOS/Linux**:

   ```bash
   # in run.sh
   work=~/projects/cs353/lab1data/
   ```

   **Windows Powershell**:

   ```powershell
   # in run.ps1
   $work="C:\Users\Username\cs353/lab1data"
   ```

   **Windows Terminal using WSL2**:

   ```bash
   work=/mnt/c/Users/Username/cs353/lab1data
   ```

2. Run the `run.sh`/`run.ps1` script. If this is your first time starting, this will
   pull the Docker image. This image will be cached until there's a new image
   available or you manually remove it.

   **macOS/Linux/Windows Terminal (WSL2)**:

   ```bash
   ./run.sh start
   ```

   **Windows Powershell**:

   ```powershell
   .\run.ps1 start
   ```

This script is only a wrapper for some simple Docker commands.

### Working in the Environment

To start up a Linux shell inside the Docker image, you'll want to start a terminal session inside the Docker image:

**macOS/Linux/Windows Terminal (WSL2)**:

```bash
./run.sh shell
```

**Windows Powershell**:

```powershell
.\run.ps1 shell
```

### Stopping

After you're done working in the environment, you might want to stop the container. Don't worry if you forget to
do this, since Docker Desktop will automatically and safely stop running containers when you shutdown your computer.

**macOS/Linux/Windows Terminal (WSL2)**:

```shell
./run.sh stop
```

**Windows Powershell**:

```powershell
.\run.ps1 stop
```

## System Requirements

Below are the system requirements for Docker Desktop:

[Windows host](https://docs.docker.com/docker-for-windows/install/):

- Windows 10 64-bit: (Build 15063 or later)
  - Pro, Enterprise, or Education: using Hyper-V and Containers Windows features
  - Any Windows 10 version: using WSL2 container backend **(recommended)**

If you are using Windows 10 Home, you can obtain a "free" license for Windows 10 Education [here](https://viterbiit.usc.edu/services/hardware-software/microsoft-imagine-downloads/).

[Mac host](https://docs.docker.com/docker-for-mac/install/):

- Mac hardware must be a 2010 or newer model
- macOS must be version 10.13 or newer
- 4 GB RAM minimum

[Linux host](https://docs.docker.com/engine/install/):

- Use the Docker-provided install instructions if it exists for your distro, otherwise 
