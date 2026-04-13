#!/bin/bash

########################################################################################################
#                 PROCESSO DE REMOÇÃO DE PACOTES E SUAS CONFIGURAÇÕES                                  #
########################################################################################################

contador_do_while=1  

echo "Neste processo será realizada a remoção de pacotes e suas configurações" 

echo  

funcao_remocao_de_pacotes() {  # Declaração da função principal

    while [ "$contador_do_while" = "1" ]; do  # Loop que mantém o processo ativo até o usuário sair

        echo "Digite o pacote que deseja remover:"  # Solicita o nome do pacote
        
	read pacote_para_remocao  # Armazena o nome digitado pelo usuário
        
	echo  

        # Verifica se o pacote existe nos repositórios
        if apt-cache show "$pacote_para_remocao" > /dev/null 2>&1
        then

            # Verifica se o pacote NÃO está instalado no sistema
            if apt-cache policy "$pacote_para_remocao" | grep "(nenhum)" > /dev/null 2>&1
            then
                echo
                
		echo "Você não possui esse pacote no sistema. Deseja encerrar o processo? (s/n)"
                
		read encerra_processo  # Lê resposta do usuário

                test "$encerra_processo" = "s"  && break  # Se resposta for "s", sai do loop

                echo
                
		echo "Ok, voltando ao início. Digite novamente."  # Reinicia o processo
                
		echo

            else  # Caso o pacote exista e esteja instalado

                apt-cache show "$pacote_para_remocao"  # Mostra informações do pacote
                
		echo

                echo "Deseja realmente remover esse pacote? (s/n)"  # Confirma remoção
                
		read remover_pacote

                if [ "$remover_pacote" = "s" ]  # Se usuário confirmar
                then
                    sudo apt-get remove "$pacote_para_remocao"  # Remove o pacote

                    echo
                    
		    echo "Remoção concluída. Deseja apagar também as configurações desse pacote? (s/n)"
                    
		    read apagar_configuracao  # Pergunta se deseja remover configurações
                    
		    echo

                    # Se usuário quiser remover configurações
                    if [ "$apagar_configuracao" = "s" ]
                    then
                        sudo apt-get purge "$pacote_para_remocao"  # Remove pacote + configurações
                        
			echo "Configurações removidas com sucesso"
                    fi

                    echo
                    
		    echo "Deseja continuar o processo? (s/n)"  # Pergunta se quer continuar
                    
		    read encerra_processo

                    [ "$encerra_processo" = "n" ] && break  # Se "n", encerra o loop

                    echo
                    
		    echo "Ok, o processo continuará."

                else  # Caso o usuário não queira remover
                    echo
                    
		    echo "Processo continuará sem remoção."
                    
		    echo
                fi

                echo
                
		echo "Deseja encerrar o processo? (s/n)"  # Pergunta final
                
		read encerra_processo

                test "$encerra_processo" = "s" && break  # Se "s", encerra o loop

                echo
                
		echo "Processo continuará."
            
	    fi

        else  # Caso o pacote não exista (erro de digitação)
            echo
            
	    echo "Erro: nome do pacote inválido. Digite novamente."
        
	fi

    done  # Fim do loop while
}

funcao_remocao_de_pacotes  # Chamada da função para iniciar o programa
