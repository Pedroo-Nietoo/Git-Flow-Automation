#!/bin/sh
# ---------------------------------------------- #
# Easy Health Git Flow GUI                       #
# Author: Pedro Henrique Nieto da Silva          #
# ---------------------------------------------- #

gum style \
    --foreground "212" --border-foreground "212" --border double \
    --align center --width 30 --margin "1 1" --padding "1 0.5" \
    'Commit GUI' 'Selecione o tipo de commit:'

COMMIT_TYPE=$(gum choose "Feature" "Hotfix" "Bugfix")

if [ "$COMMIT_TYPE" = "Feature" ]; then
    clear
    # gum spin --spinner dot --title "Pulling updates from develop..." -- sh -c 'git checkout develop && git pull'

    if git checkout develop && git pull; then
        clear
        gum log --level info "Branch 'develop' atualizada."
    else
        gum log --level error "Erro ao atualizar a branch 'develop'."
    fi
    echo "---------------------------------------"
    echo "Digite o ID da tarefa do Jira + Módulo:"
    SCOPE=$(gum input --placeholder "Ex: ER3S-1234-atendimento")
    //todo add criação da feature
elif [ "$COMMIT_TYPE" = "Hotfix" ]; then
    echo "Hotfix"
elif [ "$COMMIT_TYPE" = "Bugfix" ]; then
    gum log --time timeonly --level error "Erro de Merge:"
    echo "JSON LALALLALALALALAL"
else
    clear
    gum confirm "Deseja cancelar a operação" && gum log --level info "Commit cancelado." || gum log --level info "Operação continuada."
fi

# gum log "Running git command: $*"
# # TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")


# TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
# SCOPE=$(gum input --placeholder "scope")

# # Since the scope is optional, wrap it in parentheses if it has a value.
# test -n "$SCOPE" && SCOPE="($SCOPE)"

# # Pre-populate the input with the type(scope): so that the user may change it
# SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
# DESCRIPTION=$(gum write --placeholder "Details of this change")

# # Commit these changes if user confirms
# gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"

# gum log -tsl $SUMMARY ..... $DESCRIPTION
