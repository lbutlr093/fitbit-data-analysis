#!/bin/sh
python process_raw_files.py

Rscript data_cleanse.R

Rscript data_visuals.R