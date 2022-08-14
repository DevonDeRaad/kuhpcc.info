#!/bin/sh
#
#SBATCH --job-name=get.data               # Job Name
#SBATCH --nodes=1               # 40 nodes
#SBATCH --ntasks-per-node=1               # 40 CPU allocation per Task
#SBATCH --partition=sixhour            # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/work/kuhpcc.info 	# Set working d$
#SBATCH --mem=1000            # memory requested
#SBATCH --time=10

#clear job outputs
rm slurm-*
#copy in the data
cp /panfs/pfs.local/work/bi/usage.txt .

#remove header line
tail -n +2 usage.txt > clean.usage.txt

#git config
git config --global user.email "deraad@oxy.edu"
git config --global user.name "DevonDeRaad"
#git add
git add .
#git commit
git commit -m "hourly commit"
#git push
git push -u origin master
