#!/bin/sh
# ---------------------------------------------- #
# Git Flow GUI                                   #
# Author: Pedro Henrique Nieto da Silva          #
# ---------------------------------------------- #

gum style \
    --foreground "212" --border-foreground "212" --border double \
    --align center --width 40 --margin "1 1" --padding "1 0.5" \
    'Commit GUI' 'Selecione o que deseja realizar:'

COMMIT_TYPE=$(gum choose "Feature" "Hotfix" "Bugfix")

if [ "$COMMIT_TYPE" = "Feature" ]; then
    clear


<<<<<<< HEAD
    echo "Selecione o processo que deseja realizar:"
    FEATURE_OPTION=$(gum choose "Iniciar Feature" "Publicar Feature" "Selecionar Feature" "Finalizar Feature")

    if [ "$FEATURE_OPTION" = "Iniciar Feature" ]; then
        
=======
    echo "Selecione o processo que deseja realizar:\n"
    FEATURE_OPTION=$(gum choose "Iniciar Feature" "Publicar Feature" "Selecionar Feature" "Finalizar Feature")

    if [ "$FEATURE_OPTION" = "Iniciar Feature" ]; then
        clear

>>>>>>> develop
        gum spin --spinner dot --title "Baixando atualizações da 'develop'..." -- sh -c 'git checkout develop && git pull'
        exit_code=$?

        if [ $exit_code -eq 0 ]; then
            clear
<<<<<<< HEAD
            gum log --level info "Branch 'develop' atualizada."
=======
            gum log --level info "Atualizações da 'develop' aplicadas."
>>>>>>> develop

            echo "\nDigite o ID da tarefa do Jira + Módulo:"

            SCOPE=$(gum input --placeholder "Ex: ER3S-1234-atendimento")

            gum spin --spinner dot --title "Criando Feature..." -- sh -c `git flow feature start $SCOPE`
<<<<<<< HEAD
            echo "\n"
            gum log --level info "Feature criada com sucesso: " $SCOPE
=======
            
            clear
            gum log --time timeonly --level info "Feature criada com sucesso!"
            echo "\n"
            gum style \
                --foreground "#45e4d7" --align left --margin "0" --padding "0" "Branch atual: " && git branch | grep "*"
>>>>>>> develop

            gum confirm "Deseja adicionar arquivos?" && {
            gum spin --spinner dot --title "Adicionando arquivos..." -- sh -c `clear && git add . && git status`

<<<<<<< HEAD
            echo "Digite o ID de sua tarefa no Jira:"
            JIRA_TASK_ID=$(gum input --placeholder "Ex: ER3S-1234")

            echo "\nDigite o comentário de sua tarefa:"
=======
            echo "\n"

            echo "Digite o ID de sua tarefa no Jira:"
            JIRA_TASK_ID=$(gum input --placeholder "Ex: ER3S-1234")

            echo "\nDigite o comentário de sua tarefa:\n"
>>>>>>> develop
            TASK_COMMENT=$(gum write --placeholder "Comentário")

            echo "\nDigite o tempo que sua tarefa levou:"
            TASK_TIME=$(gum input --placeholder "Ex: 1h 30m")
<<<<<<< HEAD

            git commit -m "$JIRA_TASK_ID: #$TASK_COMMENT #$TASK_TIME"

            gum log --level info "Arquivos commitados na feature $SCOPE com sucesso."
            } || gum log --level warn "Arquivos não commitados."
        else
            clear
            gum log --level error "Erro ao atualizar a branch 'develop':"
=======
            
            clear
            gum spin --spinner dot --title "Commitando arquivos..." -- sh -c `git commit -m "$JIRA_TASK_ID: #$TASK_COMMENT #$TASK_TIME"`

            gum log --time timeonly --level info "Arquivos commitados na feature $SCOPE com sucesso."
            } || gum log --time timeonly --level warn "Arquivos não commitados."
        else
            clear
            gum log --time timeonly --level error "Erro ao puxar atualizações da 'develop':"
>>>>>>> develop
        fi

    elif [ "$FEATURE_OPTION" = "Publicar Feature" ]; then
        gum spin --spinner dot --title "Publicando a Feature..." -- sh -c 'git flow feature publish'
        exit_code=$?

        if [ $exit_code -eq 0 ]; then
<<<<<<< HEAD
            gum log --type info "Feature publicada com sucesso."
        else
            gum log --level error "Erro ao publicar a Feature:"
        fi

    elif [ "$FEATURE_OPTION" = "Selecionar Feature" ]; then
        gum spin --spinner dot --title "Selecionando a Feature..." -- sh -c `git flow feature track $SCOPE`
=======
            gum log --time timeonly --type info "Feature publicada com sucesso."
        else
            gum log --time timeonly --level error "Erro ao publicar a Feature:"
        fi

    elif [ "$FEATURE_OPTION" = "Selecionar Feature" ]; then
        clear

        echo "Digite o nome da branch da feature que deseja selecionar:"
        BRANCH_NAME=$(gum input --placeholder "Ex: ER3S-1234-atendimento")
        
        gum spin --spinner dot --title "Selecionando a Feature..." -- sh -c `git flow feature track $BRANCH_NAME`
>>>>>>> develop
        exit_code=$?

        if [ $exit_code -eq 0 ]; then
            gum log --type info "Feature selecionada com sucesso."
        else
            gum log --level error "Erro ao selecionar a Feature:"
        fi


    elif [ "$FEATURE_OPTION" = "Finalizar Feature" ]; then
<<<<<<< HEAD
=======
        clear
>>>>>>> develop
        gum spin --spinner dot --title "Baixando atualizações da 'develop'..." -- sh -c 'git pull origin develop'
        exit_code=$?

        if [ $exit_code -eq 0 ]; then
<<<<<<< HEAD
            gum log --level info "Branch 'develop' atualizada."
            gum confirm "Desja finalizar a Feature?" && git flow feature finish $SCOPE && git push || gum log --level warn "Feature não finalizada."
        else
            gum log --level error "Erro ao puxar atualizações da 'develop':"
=======
            gum log --level info "Atualizações da 'develop' aplicadas."
            gum confirm "Desja finalizar a Feature?" && git flow feature finish $SCOPE && git push || gum log --level warn "Feature não finalizada."
        else
            gum log --time timeonly --level error "Erro ao puxar atualizações da 'develop':"
>>>>>>> develop
        fi
    else
        clear
        gum log --level error "Erro ao puxar atualizações da 'develop':"
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
