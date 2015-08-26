# Loop thru subdirectories and source them
directories=(profile functions aliases)

for directory in "${directories[@]}"; do
  for file in ${HOME}/.shell/${directory}/*.sh; do
    if [ -f "$file" ]; then
      . ${file}
    fi
  done
done
