#/bin/bash

HOME="$NOTES/Todo"
TODOS="$HOME/$(date +%Y-%B-%d).md"
[[ ! -d "$HOME"  ]] && mkdir -p $HOME
[[ ! -f "$TODOS" ]] && touch $TODOS && echo -e "$(date +%Y-%B-%d):" >> $TODOS

case $1 in
  "all") for file in $HOME/*; do cat $file; echo; done ;;
  "add") echo -e "- [ ] ${@: 2}" >> $TODOS ;;
  "remove") 
    LINE=$(grep -n "${@: 2}" $TODOS | cut -d ":" -f1)  
    sed -i "${LINE}d" $TODOS  ;;
  "list") cat $TODOS;;
  "done") 
    LINE=$(grep -n "${@: 2}" $TODOS | cut -d ":" -f1)  
    sed -i "${LINE}s/- \[ \]/- \[x\]/" $TODOS  ;;
  "undone") 
    LINE=$(grep -n "${@: 2}" $TODOS | cut -d ":" -f1)  
    sed -i "${LINE}s/- \[x\]/- \[ \]/" $TODOS  ;;
  *) 
    echo "Simple terminal todo"
    echo "Usage: todo [COMMAND] [TODO]"
    echo
    echo "Commands:"
    echo "add		add new todo"
    echo "remove		remove a todo"
    echo "done		mark todo as done"
    echo "undone		mark todo as undone"
    echo "list		list of today's todos"
    echo "all		list of all undone todos from all days"
    ;;
esac
