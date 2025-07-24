# Introduction

*[Français](README_fr.md)*

This repository contains workshop materials for Theme 2 of the [Workshop on Statistical Genetics and Genetic Epidemiology STAGE-Quebec](https://www.crmath.ca/en/activities/#/type/activity/id/4039).

Theme 2 focuses on **Molecular Phenotypes in Genetic Epidemiology** and will guide you through conducting and interpreting transcriptome-wide association studies (TWAS) using S-PrediXcan and TWAS/FUSION.

# Before the Workshop

## Installing Docker

Installing S-PrediXcan and FUSION and locating all required files can be tedious. To streamline the workshop, we have prepared a containerized environment with pre-installed software and pre-processed data. 

**Prerequisites:** Install [Docker Desktop](https://www.docker.com/) for your operating system.

## Running the Environment

We have prepared launcher scripts to start the environment:

- [Windows Launcher](https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_windows.bat)
- [macOS / Linux Launcher](https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_macOS_linux.sh)

**Storage requirement:** ~5GB of available disk space

**Instructions:**

### macOS / Linux
Open Terminal and run:
```bash
curl -fsSL https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_macOS_linux.sh | sh
```

### Windows
Download and double-click: [Windows Launcher](https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_windows.bat)

### What Does the Launcher Do?

The launcher creates a folder in your home directory called `STAGE2025_workshop_theme2`:
- **macOS:** `/Users/[Your Username]/STAGE2025_workshop_theme2`
- **Windows:** `C:\Users\[Your Username]\STAGE2025_workshop_theme2`

**Important:** All persistent files must be created in this directory. Files created elsewhere will be lost when the container stops.

The folder is automatically populated with workshop materials (Jupyter notebooks) that you can access from the environment.

### Accessing the Computing Environment

**While the launcher script is running, access the workshop environment at:**
[http://127.0.0.1:8888/lab](http://127.0.0.1:8888/lab)

## What's Included?

The computing environment contains:

### Workshop Materials
- Interactive Jupyter notebooks with step-by-step tutorials
- Utility functions for data visualization (`/workshop/utilities`)

### Pre-installed Software
- **[MetaXcan package](https://github.com/hakyimlab/MetaXcan)**
  - Model weights from [PredictDB](https://predictdb.hakyimlab.org/)
  - Elastic net (`en`) models for 7 GTEx tissues
  - [Inflation-corrected models](https://predictdb.hakyimlab.org/post/2024/11/11/twas-inflation-corrected-models/) for polygenicity adjustment

- **R [FUSION scripts](http://gusevlab.org/projects/fusion/)**
  - Model weights for GTEx pancreas and Young Finns Study whole blood
  - LD reference genotypes from 1000 Genomes data

### Pre-processed Data
- **Type 2 Diabetes GWAS Summary Statistics**
  - Source: [DIAGRAM/DIAMANTE/T2DGGI consortium](https://diagram-consortium.org/index.html)
  - [European ancestry data](https://www.nature.com/articles/s41588-022-01058-3)
  - Lifted over from GRCh37 to GRCh38
  - Harmonized with TWAS model variants
