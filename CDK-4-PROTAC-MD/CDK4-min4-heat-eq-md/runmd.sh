#!/bin/bash
#SBATCH --nodes=1
#SBATCH --job-name=p1
#SBATCH --partition=a100
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:1
#SBATCH --output=%j.out
#SBATCH --error=%j.err

module load amber/24

pmemd.cuda -O -i md.in -o md1.out -p PROTAC1-7_wat.prmtop -c eq4.rst -r md1.rst -x md1.mdcrd
