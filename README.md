*[Français](README_fr.md)*

# Introduction

This repository contains workshop materials for Theme 2 of the <a href="https://www.crmath.ca/en/activities/#/type/activity/id/4039" target="_blank">Workshop on Statistical Genetics and Genetic Epidemiology STAGE-Quebec</a>.

Theme 2 focuses on **Molecular Phenotypes in Genetic Epidemiology** and will guide you through conducting and interpreting transcriptome-wide association studies (TWAS) using S-PrediXcan and TWAS/FUSION.

# Before the Workshop

## Installing Docker

Installing S-PrediXcan and FUSION and locating all required files can be tedious. To streamline the workshop, we have prepared a containerized environment with pre-installed software and pre-processed data. 

**Prerequisites:** Install <a href="https://www.docker.com/" target="_blank">Docker Desktop</a> for your operating system.

## Running the Environment

We have prepared launcher scripts to start the environment:

- <a href="https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_windows.bat" target="_blank">Windows Launcher</a>
- <a href="https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_macOS_linux.sh" target="_blank">macOS / Linux Launcher</a>

**Storage requirement:** ~5GB of available disk space

**Instructions:**

### macOS / Linux
Open Terminal and run:
```bash
curl -fsSL https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_macOS_linux.sh | sh
```

### Windows
Download and double-click: <a href="https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_windows.bat" target="_blank">Windows Launcher</a>

### What Does the Launcher Do?

The launcher creates a folder in your home directory called `STAGE2025_workshop_theme2`:
- **macOS:** `/Users/[Your Username]/STAGE2025_workshop_theme2`
- **Windows:** `C:\Users\[Your Username]\STAGE2025_workshop_theme2`

**Important:** All persistent files must be created in this directory. Files created elsewhere will be lost when the container stops.

The folder is automatically populated with workshop materials (Jupyter notebooks) that you can access from the environment.

### Accessing the Computing Environment and Tutorials

**When the launcher script has completed, access the workshop environment at:**
<a href="http://127.0.0.1:8888/lab" target="_blank">http://127.0.0.1:8888/lab</a>

**To access the tutorials**, use the left pane to browse through files in the "local" folder. The files with the _.ipynb_ extension contain the interactive tutorials. Double-click on the first notebook (_1a-S-PrediXcan-tutorial_and_exploration.ipynb_) and you will be ready to start!

## What's Included?

The computing environment contains:

### Workshop Materials
- Interactive Jupyter notebooks with step-by-step tutorials
- Utility functions for data visualization (`/workshop/utilities`)

### Pre-installed Software
- **<a href="https://github.com/hakyimlab/MetaXcan" target="_blank">MetaXcan package</a>**
  - Model weights from <a href="https://predictdb.hakyimlab.org/" target="_blank">PredictDB</a>
  - Elastic net (`en`) models for 7 GTEx tissues
  - <a href="https://predictdb.hakyimlab.org/post/2024/11/11/twas-inflation-corrected-models/" target="_blank">Inflation-corrected models</a> for polygenicity adjustment

- **R <a href="http://gusevlab.org/projects/fusion/" target="_blank">FUSION scripts</a>**
  - Model weights for GTEx pancreas and Young Finns Study whole blood
  - LD reference genotypes from 1000 Genomes data

### Pre-processed Data
- **Type 2 Diabetes GWAS Summary Statistics**
  - Source: <a href="https://diagram-consortium.org/index.html" target="_blank">DIAGRAM/DIAMANTE/T2DGGI consortium</a>
  - <a href="https://www.nature.com/articles/s41588-022-01058-3" target="_blank">European ancestry data</a>
  - Lifted over from GRCh37 to GRCh38
  - Harmonized with TWAS model variants

### Access notebooks without Docker

A non-interactive version of the materials can be found <a href="https://nbviewer.org/github/pgx-ml-lab/2025-STAGE-workshop-TWAS/tree/main/notebooks/" target="_blank">here</a>.
