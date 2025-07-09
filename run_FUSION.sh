#!/usr/bin/env bash


docker run \
    -v /mnt/DS1821/FUSION/NTR_BLOOD_RNAARR:/weights \
    -v $PWD:/local \
    -ti --rm \
    twas_fusion \
    --sumstats /local/Mahajan.NatGen2022.DIAMANTE-EUR.ldsc_ss.tsv \
    --weights /weights/NTR.BLOOD.RNAARR.pos \
    --weights_dir /weights/ \
    --ref_ld_chr /LDREF/1000G.EUR. \
    --chr 22 \
    --out /local/test_22.out
