# Introduction

This page hosts the workshop materials for Theme 2 of the [Workshop on Statistical Genetics and Genetic Epidemiology STAGE-Quebec](https://www.crmath.ca/en/activities/#/type/activity/id/4039).

Theme 2 focuses on Molecular Phenotypes in Genetic Epidemiology and will help you conduct and interpret transcriptome-wide association studies (TWAS) using S-PrediXcan and TWAS/FUSION.

# Before the workshop

## Installing docker

Installing S-PrediXcan and FUSION and finding all of the required files can be tedious. To streamline the workshop, we have prepared a containerized environment with pre-installed software and pre-processed data. To run this environment, you must first install Docker.

You can find the [Docker Desktop](https://www.docker.com/) application for your operating system online.

## Running the environment

We prepared launcher scripts to start the environment.

- [Windows Launcher](https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_windows.bat)
- [macOS / Linux Launcher](https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_macOS_linux.sh)

You can download and execute these scripts to launche the environment. In macOS, you can execute the script by drag and dropping the file into a Terminal window, or by right clicking it and using "Open with -> Terminal".

Under Windows ...

### What does this launcher do?

The launcher will create a folder in your home directory called ``STAGE2025_workshop_theme2``. Under macOS, this will be something like ``/Users/Your Username/STAGE2025_workshop_theme2`` and under Windows it will be in ``C:\Users\Your Username\STAGE2025_workshop_theme2``. **All of the persistent files should be created in this directory!** The other materials will be erased if the environment is closed.
