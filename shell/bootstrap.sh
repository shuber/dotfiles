for file in ${HOME}/.shell/*.sh; do
  if [[ ! "$file" =~ "/bootstrap.sh" ]]; then
    if [ -f "$file" ]; then
      . ${file}
    fi
  fi
done
