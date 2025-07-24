*[English](README.md)*

# Introduction

Ce répertoire contient le matériel d'atelier pour le Thème 2 de l'[Atelier sur la génétique statistique et l'épidémiologie génétique STAGE-Québec](https://www.crmath.ca/en/activities/#/type/activity/id/4039).

Le Thème 2 porte sur les **Phénotypes moléculaires en épidémiologie génétique** et vous guidera dans la réalisation et l'interprétation d'études d'association à l'échelle du transcriptome (TWAS) utilisant S-PrediXcan et TWAS/FUSION.

# Avant l'atelier

## Installation de Docker

L'installation de S-PrediXcan et FUSION ainsi que la localisation de tous les fichiers requis peuvent être fastidieuses. Pour simplifier l'atelier, nous avons préparé un environnement conteneurisé avec des logiciels pré-installés et des données pré-traitées.

**Prérequis :** Installez [Docker Desktop](https://www.docker.com/) pour votre système d'exploitation.

## Exécution de l'environnement

Nous avons préparé des scripts de lancement pour démarrer l'environnement :

- [Lanceur Windows](https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_windows.bat)
- [Lanceur macOS / Linux](https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_macOS_linux.sh)

**Exigence de stockage :** ~5 Go d'espace disque disponible

**Instructions :**
1. Téléchargez le script de lancement approprié (clic droit → « Enregistrer le lien sous »)
2. Exécutez le script :
   - **macOS :** Glissez-déposez le fichier dans le Terminal, ou clic droit → « Ouvrir avec le Terminal »
   - **Windows :** Double-cliquez sur le fichier `.bat` ou lancez-le depuis l'Invite de commande

### Que fait ce lanceur ?

Le lanceur crée un dossier dans votre répertoire personnel appelé `STAGE2025_workshop_theme2` :
- **macOS :** `/Users/[Votre nom d'utilisateur]/STAGE2025_workshop_theme2`
- **Windows :** `C:\Users\[Votre nom d'utilisateur]\STAGE2025_workshop_theme2`

**Important :** Tous les fichiers persistants doivent être créés dans ce répertoire. Les fichiers créés ailleurs seront perdus lorsque le conteneur s'arrêtera.

Le dossier est automatiquement peuplé avec le matériel d'atelier (cahiers Jupyter) auquel vous pouvez accéder depuis l'environnement.

### Accès à l'environnement informatique

**Pendant que le script de lancement est en cours d'exécution, accédez à l'environnement d'atelier à :**
[http://127.0.0.1:8888/lab](http://127.0.0.1:8888/lab)

## Qu'est-ce qui est inclus ?

L'environnement informatique contient :

### Matériel d'atelier
- Cahiers Jupyter interactifs avec des tutoriels étape par étape
- Fonctions utilitaires pour la visualisation de données (`/workshop/utilities`)

### Logiciels pré-installés
- **[Progiciel MetaXcan](https://github.com/hakyimlab/MetaXcan)**
  - Poids de modèles de [PredictDB](https://predictdb.hakyimlab.org/)
  - Modèles de réseau élastique (`en`) pour 7 tissus GTEx
  - [Modèles corrigés pour l'inflation](https://predictdb.hakyimlab.org/post/2024/11/11/twas-inflation-corrected-models/) pour l'ajustement de la polygénicité

- **Scripts R [FUSION](http://gusevlab.org/projects/fusion/)**
  - Poids de modèles pour le pancréas GTEx et le sang total de l'étude Young Finns
  - Génotypes de référence LD des données 1000 Genomes

### Données pré-traitées
- **Statistiques sommaires GWAS du diabète de type 2**
  - Source : [Consortium DIAGRAM/DIAMANTE/T2DGGI](https://diagram-consortium.org/index.html)
  - [Données d'ascendance européenne](https://www.nature.com/articles/s41588-022-01058-3)
  - Transférées de GRCh37 vers GRCh38
  - Harmonisées avec les variants des modèles TWAS