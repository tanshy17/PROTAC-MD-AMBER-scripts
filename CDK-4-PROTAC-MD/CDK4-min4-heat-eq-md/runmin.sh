#!/bin/bash
#SBATCH --job-name=p1
#SBATCH --partition=fat
#SBATCH -N 1        #节点数量
#SBATCH --ntasks-per-node=80   #核数
#SBATCH --output=%j.out
#SBATCH --error=%j.err

module load amber/24

#mpirun pmemd.MPI -O -i min1.in -o min1.out -p PROTAC1-7_wat.prmtop -c PROTAC1-7_wat.inpcrd -r  min1.rst -ref PROTAC1-7_wat.inpcrd
#mpirun pmemd.MPI -O -i min2.in -o min2.out -p PROTAC1-7_wat.prmtop -c  min1.rst -r  min2.rst -ref min1.rst
#mpirun pmemd.MPI -O -i min3.in -o min3.out -p PROTAC1-7_wat.prmtop -c  min2.rst -r  min3.rst -ref min2.rst
#mpirun pmemd.MPI -O -i min4.in -o min4.out -p PROTAC1-7_wat.prmtop -c  min3.rst -r  min4.rst -ref min3.rst
#mpirun pmemd.MPI -O -i min5.in -o min5.out -p PROTAC1-7_wat.prmtop -c  min4.rst -r  min5.rst -ref min4.rst
#mpirun pmemd.MPI -O -i min6.in -o min6.out -p PROTAC1-7_wat.prmtop -c  min5.rst -r  min6.rst
#mpirun pmemd.MPI -O -i heat.in -o heat.out -p PROTAC1-7_wat.prmtop -c  min6.rst -r  heat.rst -ref min6.rst
#mpirun pmemd.MPI -O -i eq1.in -o eq1.out -p PROTAC1-7_wat.prmtop -c  heat.rst -r  eq1.rst -ref min6.rst
#mpirun pmemd.MPI -O -i eq2.in -o eq2.out -p PROTAC1-7_wat.prmtop -c  eq1.rst -r  eq2.rst -ref eq1.rst
mpirun pmemd.MPI -O -i eq3.in -o eq3.out -p PROTAC1-7_wat.prmtop -c eq2.rst -r eq3.rst -ref eq2.rst
mpirun pmemd.MPI -O -i eq4.in -o eq4.out -p PROTAC1-7_wat.prmtop -c eq3.rst -r eq4.rst -x eq4.mdcrd
