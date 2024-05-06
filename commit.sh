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
    gum spin --spinner dot --title "Pulling updates from 'develop'..." -- sh -c 'git checkout develop && git pull'
    exit_code=$?

    if [ $exit_code -eq 0 ]; then
        clear
        gum log --level info "Branch 'develop' atualizada."
        echo "\nDigite o ID da tarefa do Jira + Módulo:"
        SCOPE=$(gum input --placeholder "Ex: ER3S-1234-atendimento")
        #todo add criação da feature (git flow feature start $SCOPE)
        gum confirm "Deseja adicionar arquivos?" && clear && git add . && git status || gum log --level info "Nenhum arquivo adicionado."

        echo "Digite o ID de sua tarefa no Jira:"
        JIRA_TASK_ID=$(gum input --placeholder "Ex: ER3S-1234")

        echo "\nDigite o comentário de sua tarefa:"
        TASK_COMMENT=$(gum write --placeholder "Comentário")

        echo "\nDigite o tempo que sua tarefa levou:"
        TASK_TIME=$(gum input --placeholder "Ex: 1h 30m")

        git commit -m "$SCOPE: #$JIRA_TASK_ID #$TASK_COMMENT #$TASK_TIME"

        clear

        echo "Selecione o processo que deseja realizar:"
        gum choose "Publicar Feature" "Selecionar Feature" "Finalizar Feature"
    else
        clear
        gum log --level error "Erro ao atualizar a branch 'develop':"
    fi
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
