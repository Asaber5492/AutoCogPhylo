#!/bin/bash
# Job name:
#SBATCH --job-name=sca-an-45-210.paps
#
# Project:
#SBATCH --account=nn9106k
#
# Wall clock limit:
#SBATCH --time=5:00:00
#
# Max memory usage:
#SBATCH --mem-per-cpu=1G
# Number of tasks (cores):
#SBATCH --ntasks=6
## Set up job environment:
source /cluster/bin/jobsetup
module purge   # clear any inherited modules
set -o errexit # exit on errors
module load intelmpi.intel/5.0.2
cp /usit/abel/u1/tarakark/glottcode_nexus/sca-an-45-210.paps.mb $SCRATCH
cp /usit/abel/u1/tarakark/glottcode_nexus/sca-an-45-210.paps.nex $SCRATCH
cp -r /usit/abel/u1/tarakark/mrbayes-coal/mrbayes-3.2.6/ $SCRATCH
chkfile sca-an-45-210.paps.nex.run1.p sca-an-45-210.paps.nex.run2.p sca-an-45-210.paps.nex.run1.t sca-an-45-210.paps.nex.run2.t sca-an-45-210.paps.nex.con.tre sca-an-45-210.papslog.txt
cd $SCRATCH
mpirun -np 6 mrbayes-3.2.6/src/mb sca-an-45-210.paps.mb > sca-an-45-210.papslog.txt
