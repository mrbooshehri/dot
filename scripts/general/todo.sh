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
        if [[ $(grep -c '\- \[ \]' $file) -gt 0 ]]; then
          basename -- $file | cut -d. -f1  
          grep '\- \[ \]' $file
          echo 
        fi
      fi
    done 
    ;;
  "add") echo -e "- [ ] ${@: 2}" >> $TODOS ;;
  "remove") 
    LINE="$2"
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
    echo "Usage: todo [COMMAND] [TASK]"
    echo
    echo "Commands:"
    echo "  add		add new task"
    echo "  remove	remove a task"
    echo "  done		mark task as done by getting task number"
    echo "  undone	mark task as undone by getting task number"
    echo "  list		list of today's tasks"
    echo "  all		list of all undone tasks from all days"
    ;;
esac
