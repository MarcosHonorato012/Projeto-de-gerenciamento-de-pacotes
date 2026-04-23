#! /bin/bash

#######################################################################################################################################
# Gerenciador de pacotes automatizado (com menu interativo): atualiza, instala, remove, limpa o cache dos pacotes não utilizados e mostra informações:
#######################################################################################################################################

contador_do_while=1



funcao_informacao_dos_pacotes() {

    contador_do_while_informacoes=1  

    echo "Digite qual pacote deseja verificar as informações:"  

    read pacote_ver_informacoes  



    while [ "$contador_do_while_informacoes" = "1" ]
    do

        if apt-cache show "$pacote_ver_informacoes" > /dev/null 2>&1
        then

            echo "Deseja verificar se o pacote está no sistema? (s/n)"  

            read resposta_se_esta_instalado  

            echo  



            if [ "$resposta_se_esta_instalado" = "s" ]
            then

                apt-cache policy "$pacote_ver_informacoes" | grep "Instalado:"  

                echo  

            fi



            echo  

            echo "Deseja verificar as dependências do pacote? (s/n)"  

            read resposta_dependencia_do_pacote  

            echo  



            if [ "$resposta_dependencia_do_pacote" = "s" ]
            then

                apt-cache show "$pacote_ver_informacoes" | grep "Depends:"  

                echo  

            fi



            echo "Deseja ver o tamanho do pacote? (s/n)"  

            read resposta_tamanho_do_pacote  

            echo  



            if [ "$resposta_tamanho_do_pacote" = "s" ]
            then

                echo "Tamanho no disco:"  

                apt-cache show "$pacote_ver_informacoes" | grep "Installed-Size:"  

                echo  



                echo "Tamanho para download:"  

                apt show "$pacote_ver_informacoes" | grep "Download-Size:"  

                echo  

            fi



            echo "Quer fazer novamente as perguntas? (s/n)"  

            read recomeca  



            [ "$recomeca" = "n" ] && break



            echo  

            echo "Digite novamente o pacote:"  

            read pacote_ver_informacoes  



        else

            echo "Erro: nome do pacote inválido. Digite novamente."  

            read pacote_ver_informacoes  

        fi

    done
}



instalacao_de_pacotes(){

    while_do_instalador=1



    while [ "$while_do_instalador" = "1" ]; do

        echo "Vai querer instalar qual pacote?"  

        read pacote_do_usuario  



        if  apt-cache show "$pacote_do_usuario" > /dev/null 2>&1
        then

            if dpkg -l "$pacote_do_usuario" | grep ii > /dev/null 2>&1
            then

                echo "Você já possui esse pacote"

                echo

                echo "Esse processo de instalação será concluído"

                break

            fi



            apt-cache show "$pacote_do_usuario"

            echo



            echo "Esse é o pacote que está procurando? (s/n)"

            read resposta_do_usuario



            if [ "$resposta_do_usuario" = "s" ]
            then

                sudo apt-get install "$pacote_do_usuario" -y

                echo

                echo "Instalação concluída"

                break

            else

                echo "Digite novamente."

                echo

            fi

        else

            echo "Erro. Provavelmente foi erro de digitação"

        fi

    done
}



atualizar_os_pacotes(){

    while [ "$while_do_instalador" = "1" ]; do  



        if sudo apt-get update -y | grep "Todos os pacotes estão atualizados."
        then

            echo "Seu sistema já está totalmente atualizado. Processo de atualização finalizado"

            break

        else

            echo "Deseja atualizar um pacote específico? s/n"

            read atualizar_pacote_especifico

            echo



            if [ "$atualizar_pacote_especifico" = "s" ]
            then

                echo "Digite o nome do pacote"

                read pacote_especifico

                echo



                if apt-cache show "$pacote_especifico" > /dev/null 2>&1
                then

                    sudo apt-get install --only-upgrade"$pacote_especifico"

                    echo

                    echo "Atualização feita com sucesso"

                    echo



                    echo "Deseja atualizar o sistema? s/n"

                    read sistema_atualizar



                    if [ "$sistema_atualizar" = "s" ]
                    then

                        sudo apt update -y && sudo apt-get upgrade -y

                        echo

                        echo "Atualização do sistema completa. Processo concluído."

                        break

                    else

                        echo "Processo de atualização concluído."

                        break

                    fi

                else 

                    echo "Erro... Provavelmente errou a digitação. Digite novamente"

                fi

            else

                sudo apt update -y && sudo apt upgrade -y

                echo

                echo "Sistema atualizado. Processo concluído"

                break

            fi  

        fi

    done  
}



funcao_remocao_de_pacotes() {

    contador_da_remocao=1



    while [ "$contador_da_remocao" = "1" ]; do  

        echo "Digite o pacote que deseja remover:"  

        read pacote_para_remocao  

        echo



        if apt-cache show "$pacote_para_remocao" > /dev/null 2>&1
        then

            if apt-cache policy "$pacote_para_remocao" | grep "(nenhum)" > /dev/null 2>&1
            then

                echo

                echo "Você não possui esse pacote no sistema. Deseja encerrar o processo? (s/n)"

                read encerra_processo  



                test "$encerra_processo" = "s"  && break  

                echo

                echo "Ok, voltando ao início. Digite novamente."

                echo



            else

                apt-cache show "$pacote_para_remocao"

                echo



                echo "Deseja realmente remover esse pacote? (s/n)"

                read remover_pacote



                if [ "$remover_pacote" = "s" ]
                then

                    sudo apt-get remove "$pacote_para_remocao"

                    echo

                    echo "Remoção concluída. Deseja apagar também as configurações desse pacote? (s/n)"

                    read apagar_configuracao

                    echo



                    if [ "$apagar_configuracao" = "s" ]
                    then

                        sudo apt-get purge "$pacote_para_remocao"

                        echo "Configurações removidas com sucesso"

                    fi



                    echo

                    echo "Deseja continuar o processo? (s/n)"

                    read encerra_processo



                    [ "$encerra_processo" = "n" ] && break  



                    echo

                    echo "Ok, o processo continuará."



                else

                    echo

                    echo "Processo continuará sem remoção."

                    echo

                fi



                echo

                echo "Deseja encerrar o processo? (s/n)"

                read encerra_processo



                test "$encerra_processo" = "s" && break  

                echo

                echo "Processo continuará."

            fi

        else

            echo

            echo "Erro: nome do pacote inválido. Digite novamente."

        fi

    done
}



funcao_limpeza_no_sistema () {

    echo "Nesse processo haverá a limpeza do sistema"  

    echo  

    echo "Deseja realizar a limpeza das dependências não usadas? (s/n)"  

    read limpezas_das_dependencias  

    echo



    if [ "$limpezas_das_dependencias" = "s" ]
    then

        if sudo apt-get autoremove -n | grep "0 a serem removidos" > /dev/null 2>&1
        then  

            echo "Não há nada para limpar. O processo será encerrado"

        else

            sudo apt-get autoremove  

            echo

            echo "Limpeza de dependências concluída"

        fi

    fi



    echo "Deseja realizar a limpeza de programas não usados? (s/n)"

    read limpezas_dos_programas  



    if [ "$limpezas_dos_programas" = "s" ]
    then

        sudo apt-get autoclean  

        echo

        echo "Se nada aconteceu, o sistema não precisava remover pacotes"

    fi  



    echo "Deseja realizar a limpeza do cache? (s/n)"

    read limpeza_do_cache  



    if [ "$limpeza_do_cache" = "s" ]
    then

        sudo apt-get clean  

        echo

        echo "Limpeza do cache concluída"

        echo

    fi



    echo "Processo de limpeza terminado"
}
