#/bin/bash

HOME="$NOTES/Todo"
TODOS="$HOME/$(date +%Y-%B-%d).md"
[[ ! -d "$HOME"  ]] && mkdir -p $HOME
[[ ! -f "$TODOS" ]] && touch $TODOS

case $1 in
  "all") 
    for file in $HOME/*
    do 
      if [[ -s "$file" ]]; then
        basename -- $file | cut -d. -f1  
        cat -n $file | grep -v '^- \[x\]'
        echo 
      fi
    done 
    ;;
  "add") echo -e "- [ ] ${@: 2}" >> $TODOS ;;
  "remove") 
    LINE=$(grep -n "${@: 2}" $TODOS | cut -d ":" -f1)  
    sed -i "${LINE}d" $TODOS  ;;
  "list") 
    date +%Y-%B-%d
    cat -n $TODOS
    ;;
  "done") 
    LINE="$2"
    sed -i "${LINE}s/- \[ \]/- \[x\]/" $TODOS  ;;
  "undone") 
    LINE="$2"
    sed -i "${LINE}s/- \[x\]/- \[ \]/" $TODOS  ;;
  *) 
    echo "Simple terminal todo"
    echo "Usage: todo [COMMAND] [TODO]"
    echo
    echo "Commands:"
    echo "add		add new todo"
    echo "remove		remove a todo"
    echo "done		mark todo as done by getting task number"
    echo "undone		mark todo as undone by getting task number"
    echo "list		list of today's todos"
    echo "all		list of all undone todos from all days"
    ;;
esac
