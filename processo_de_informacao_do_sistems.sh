#!/bin/bash  # Define o interpretador bash

########################################################################################################
#   NESSE ARQUIVO CONTÉM INFORMAÇÕES SOBRE PACOTES ESCOLHIDOS PELO USUÁRIO                             #
########################################################################################################

echo "Esse processo vai mostrar informações dos pacotes solicitados pelo usuário"  # Mensagem inicial

echo  # Linha em branco

contador_do_while=1  # Variável para controlar o loop

funcao_informacao_dos_pacotes() {  # Declaração da função principal

    echo "Digite qual pacote deseja verificar as informações:"  # Pergunta ao usuário

    read pacote_ver_informacoes  # Lê o nome do pacote

    while [ "$contador_do_while" = "1" ]  # Loop principal
    do

        # Verifica se o pacote existe
        if apt-cache show "$pacote_ver_informacoes" > /dev/null 2>&1

        then

            echo "Deseja verificar se o pacote está no sistema? (s/n)"  # Pergunta ao usuário

            read resposta_se_esta_instalado  # Lê resposta

            echo  # Espaço

            # Verifica se usuário quer saber se está instalado
            if [ "$resposta_se_esta_instalado" = "s" ]

            then

                apt-cache policy "$pacote_ver_informacoes" | grep "Instalado:"  # Mostra status

                echo  # Espaço

            fi

            echo  # Espaço

            echo "Deseja verificar as dependências do pacote? (s/n)"  # Pergunta

            read resposta_dependencia_do_pacote  # Lê resposta

            echo  # Espaço

            # Mostra dependências
            if [ "$resposta_dependencia_do_pacote" = "s" ]

            then

                apt-cache show "$pacote_ver_informacoes" | grep "Depends:"  # Mostra dependências

                echo  # Espaço

            fi

            echo "Deseja ver o tamanho do pacote? (s/n)"  # Pergunta

            read resposta_tamanho_do_pacote  # Lê resposta

            echo  # Espaço

            # Mostra tamanho do pacote
            if [ "$resposta_tamanho_do_pacote" = "s" ]

            then

                echo "Tamanho no disco:"  # Explicação

                apt-cache show "$pacote_ver_informacoes" | grep "Installed-Size:"  # Tamanho instalado

                echo  # Espaço

                echo "Tamanho para download:"  # Explicação

                apt show "$pacote_ver_informacoes" | grep "Download-Size:"  # Tamanho download

                echo  # Espaço

            fi

            echo "Quer fazer novamente as perguntas? (s/n)"  # Pergunta final

            read recomeca  # Lê resposta

            # Se usuário digitar "n", sai do loop
            [ "$recomeca" = "n" ] && break

            echo  # Espaço

            echo "Digite novamente o pacote:"  # Permite novo ciclo

            read pacote_ver_informacoes  # Lê novo pacote

        else

            echo "Erro: nome do pacote inválido. Digite novamente."  # Tratamento de erro

            read pacote_ver_informacoes  # Lê novamente

        fi

    done  # Fim do while

}

funcao_informacao_dos_pacotes  # Chama a função
