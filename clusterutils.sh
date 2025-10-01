# Bash utilities for use on the Unity cluster at UML

alias 'abqfort'='/work/pi_marianna_maiaru_uml_edu/abaqus/link_ifort'
alias 'install_process_model'='pip install . -t /work/pi_marianna_maiaru_uml_edu/abaqus/SIMULIA/EstProducts/2023/linux_a64/tools/SMApy/python2.7/lib/python2.7/site-packages'
alias 'load_conda'='module load miniconda/22.11.1-1'
alias 'cd_me'='cd /work/pi_marianna_maiaru_uml_edu/michael_olaya'
export PATH=$PATH:/work/pi_marianna_maiaru_uml_edu/abaqus/SIMULIA/Commands
# export IFORT=intel-oneapi-compilers/2021.4.0
export IFORT=intel-oneapi-compilers/2024.1.0 
export ABQ_SITE_PKG=/work/pi_marianna_maiaru_uml_edu/abaqus/SIMULIA/EstProducts/2023/linux_a64/tools/SMApy/python2.7/lib/python2.7/site-packages
export WORK=/work/pi_marianna_maiaru_uml_edu/michael_olaya
export PROJECT=/project/pi_marianna_maiaru_uml_edu/michael_olaya
export ABQPY=/work/pi_marianna_maiaru_uml_edu/abaqus/SIMULIA/EstProducts/2023/linux_a64/tools/SMApy/python2.7/bin/python
export CONDA=conda/latest

# # Count files in the current folder matching a pattern
# count () {
#     c=$(find . -maxdepth 1 -name "${1}" -printf x | wc -c)
#     echo ${c}
# }

# # Set the process model conda environment
# set_prm_env () {
#     module load $CONDA
#     module load $IFORT
#     conda activate prm
# }

# Display current jobs in slurm queue with optional iteration loop time
myjobs () {
   iter=${1}
   if [ -z  ${iter} ]; then
       squeue --me
   else
       squeue --me --iterate ${iter}
   fi
}

# # Pattern renaming -- add prefix/suffix or replace using a pattern
# pren () {
#     mode=${1}
#     search_dir="${2}"
#     pattern=${3}

#     files=$(ls ${search_dir}/${pattern})
#     for f in ${files};
#     do
#         fname=$(basename ${f})
#         # Append prefix
#         if [ ${mode} == "-p" ]; then
#             appendstr=${4}
#             new_fpath=${search_dir}/${appendstr}${fname}
#         # Append suffix (before file extension)
#         elif [ ${mode} == "-s" ]; then
#             appendstr=${4}
#             ext=${fname##*.}
#             fname=${fname%.*}
#             new_fpath=${search_dir}/${fname}${appendstr}.${ext}
#         # Replace in filename
#         elif [ ${mode} == "-r" ]; then
#             find=${4}
#             repl=${5}
#             new_fpath=${search_dir}/${fname/${find}/${repl}}
#         # Do nothing
#         else
#             new_fpath=${search_dir}/${fname}
#         fi
        
#         if [ ${new_fpath} != ${f} ]; then
#             echo "renaming ${f} -> ${new_fpath}"
#             mv ${f} ${new_fpath}
#         fi
#     done  
# }

# # Clean abaqus job files in current directory
# clean_abq_jobs() {
#     echo "cleaning Abaqus job files from current working directory..."
#     rm -rf \
#     *.SMABulk \
#     *.dat \
#     *.msg \
#     *.stt \
#     *.prt \
#     *.rpy \
#     *.rpy* \
#     *.com \
#     *.exception \
#     *.guiState* \
#     *.rec \
#     *.023 \
#     *.simlog \
#     *.mdl \
#     *.cid \
#     *.odb_f \
#     *.simdir \
#     abaqus_acis*
#     echo "cleanup finished"
# }

# # Calculate approx. Abaqus token usage
# abq_tokens() {
#     # tokens=$((5*(${1} ** .422) | r))
#     cpus=${1}
#     python -c "tokens=5*(${cpus}**0.422); from math import floor; print(f'Approximate token usage for ${cpus} cpus: {floor(tokens)}')"
#     # tokens=$(bc -l <<< "5*e(.422*l(${1}))")
#     # echo Approximate token usage for ${1} cpus: ${tokens}
# }