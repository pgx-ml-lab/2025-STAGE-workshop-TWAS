*[English](README.md)*

# Introduction

Ce répertoire contient le matériel d'atelier pour le Thème 2 de l'<a href="https://www.crmath.ca/en/activities/#/type/activity/id/4039" target="_blank">Atelier sur la génétique statistique et l'épidémiologie génétique STAGE-Québec</a>.

Le Thème 2 porte sur les **Phénotypes moléculaires en épidémiologie génétique** et vous guidera dans la réalisation et l'interprétation d'études d'association à l'échelle du transcriptome (TWAS) utilisant S-PrediXcan et TWAS/FUSION.

# Avant l'atelier

## Installation de Docker

L'installation de S-PrediXcan et FUSION ainsi que la localisation de tous les fichiers requis peuvent être fastidieuses. Pour simplifier l'atelier, nous avons préparé un environnement conteneurisé avec des logiciels pré-installés et des données pré-traitées.

**Prérequis :** Installez <a href="https://www.docker.com/" target="_blank">Docker Desktop</a> pour votre système d'exploitation.

## Exécution de l'environnement

Nous avons préparé des scripts de lancement pour démarrer l'environnement :

- <a href="https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_windows.bat" target="_blank">Lanceur Windows</a>
- <a href="https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_macOS_linux.sh" target="_blank">Lanceur macOS / Linux</a>

**Exigence de stockage :** ~5 Go d'espace disque disponible

**Instructions :**

### macOS / Linux
Ouvrez le Terminal et exécutez :
```bash
curl -fsSL https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_macOS_linux.sh | sh
```

### Windows
Téléchargez et double-cliquez : <a href="https://raw.githubusercontent.com/pgx-ml-lab/2025-STAGE-workshop-TWAS/refs/heads/main/run_workshop_environment_windows.bat" target="_blank">Lanceur Windows</a>

### Que fait ce lanceur ?

Le lanceur crée un dossier dans votre répertoire personnel appelé `STAGE2025_workshop_theme2` :
- **macOS :** `/Users/[Votre nom d'utilisateur]/STAGE2025_workshop_theme2`
- **Windows :** `C:\Users\[Votre nom d'utilisateur]\STAGE2025_workshop_theme2`

**Important :** Tous les fichiers persistants doivent être créés dans ce répertoire. Les fichiers créés ailleurs seront perdus lorsque le conteneur s'arrêtera.

Le dossier est automatiquement peuplé avec le matériel d'atelier (cahiers Jupyter) auquel vous pouvez accéder depuis l'environnement.

### Accès à l'environnement informatique

**Après l'exécution du lanceur, accédez à l'environnement d'atelier à :**
<a href="http://127.0.0.1:8888/lab" target="_blank">http://127.0.0.1:8888/lab</a>

**Pour accéder aux tutoriels**, utilisez le panneau de gauche afin de naviguer dans le dossier "local". Le sous dossier "fr" contient les tutoriels en francçais. Les fichiers avec l'extension _.ipynb_ contiennent les tutoriels interactifs. Double-cliquez sur le premier cahier (_1a-S-PrediXcan_tutorial_and_exploration.ipynb_) et vous serez prêt à commencer!

## Qu'est-ce qui est inclus ?

L'environnement informatique contient :

### Matériel d'atelier
- Cahiers Jupyter interactifs avec des tutoriels étape par étape
- Fonctions utilitaires pour la visualisation de données (`/workshop/utilities`)

### Logiciels pré-installés
- **<a href="https://github.com/hakyimlab/MetaXcan" target="_blank">Progiciel MetaXcan</a>**
  - Poids de modèles de <a href="https://predictdb.hakyimlab.org/" target="_blank">PredictDB</a>
  - Modèles de réseau élastique (`en`) pour 7 tissus GTEx
  - <a href="https://predictdb.hakyimlab.org/post/2024/11/11/twas-inflation-corrected-models/" target="_blank">Modèles corrigés pour l'inflation</a> pour l'ajustement de la polygénicité

- **Scripts R <a href="http://gusevlab.org/projects/fusion/" target="_blank">FUSION</a>**
  - Poids de modèles pour le pancréas GTEx et le sang total de l'étude Young Finns
  - Génotypes de référence LD des données 1000 Genomes

### Données pré-traitées
- **Statistiques sommaires GWAS du diabète de type 2**
  - Source : <a href="https://diagram-consortium.org/index.html" target="_blank">Consortium DIAGRAM/DIAMANTE/T2DGGI</a>
  - <a href="https://www.nature.com/articles/s41588-022-01058-3" target="_blank">Données d'ascendance européenne</a>
  - Transférées de GRCh37 vers GRCh38
  - Harmonisées avec les variants des modèles TWAS