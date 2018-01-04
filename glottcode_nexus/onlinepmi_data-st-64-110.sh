#!/bin/bash
# Job name:
#SBATCH --job-name=onlinepmi_data-st-64-110
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
cp /usit/abel/u1/tarakark/glottcode_nexus/onlinepmi_data-st-64-110.mb $SCRATCH
cp /usit/abel/u1/tarakark/glottcode_nexus/onlinepmi_data-st-64-110.nex $SCRATCH
cp -r /usit/abel/u1/tarakark/mrbayes-coal/mrbayes-3.2.6/ $SCRATCH
chkfile onlinepmi_data-st-64-110.nex.run1.p onlinepmi_data-st-64-110.nex.run2.p onlinepmi_data-st-64-110.nex.run1.t onlinepmi_data-st-64-110.nex.run2.t onlinepmi_data-st-64-110.nex.con.tre onlinepmi_data-st-64-110log.txt
cd $SCRATCH
mpirun -np 6 mrbayes-3.2.6/src/mb onlinepmi_data-st-64-110.mb > onlinepmi_data-st-64-110log.txt
