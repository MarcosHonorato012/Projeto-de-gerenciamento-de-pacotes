#! /bin/bash
#######################################################################################################################################
# Gerenciador de pacotes automatizado(com menu interativo): atualiza, instala, remove, limpa o cache dos pacotes não utilizado e mons- 
# tra informações:
#######################################################################################################################################

contador_do_while=1 #Vai permite que o loop aconteçar para as perguntas para executar os processos de pacotes#

contador_dos_processo=0 #Vai realizar cada processo que for adicionado para essa váriavel#

funcao_informacao_dos_pacotes() {  # Declaração da função de informações

    	
    contador_do_while_informacoes=1  #Serve para iniciar o loop da informações#

    echo "Digite qual pacote deseja verificar as informações:"  # Pergunta ao usuário
		

    read pacote_ver_informacoes  # Lê o nome do pacote

    while [ "$contador_do_while_informacoes" = "1" ]  # Loop principal
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


teste_de_pacotes(){ #FUNÇÃO DE INSTALAÇÃO DE PACOTES#




 	while [ "$while_do_instalador" = "1" ]; do   #Perguntas para iniciar o processo#
 		echo "Vai quere instalar qual pacote?" #Pergunta para usuario qual pacote instalar#

        	read pacote_do_usuario  #Váriavel com valor do nome do pacote#

		#Vai verificar se usuario escreveu corretamente. E introduzir se esse pacote que está sendo procurado ja existe#
		if  apt-cache show "$pacote_do_usuario" > /dev/null 2>&1
		then
			if dpkg -l "$pacote_do_usuario" | grep ii > /dev/null 2>&1 #Verifica se o pacote já está no sistema, e sair do loop#
			then
				echo "Você já possui esse pacote"

				echo

				echo "Vai ser concluida esse processo de instalação"

				break
			fi

			apt-cache show $pacote_do_usuario #Amostra para saida final o pacote#

			echo

			echo "Esse é pacote que está procurando? (s/n)" #Pergunta se esse é pacote desejado#

			read resposta_do_usuario

			#Executa a instalação ou não, se não volta para o inicio para fazer novamente os comandos anterio#

			if [ "$resposta_do_usuario" = "s" ]

			then
				sudo apt-get install "$pacote_do_usuario" -y

				echo

				echo "Instalação concluida"

				break
			else
				echo "Digite novamente."

				echo

			fi

		else #Monstra erro, como saida, pois, quem escreveu pode ter digitada errado#
			echo "Erro. Provalvelmente foi erro de digitação"
		fi
	done
	 }

	
atualizar_os_pacotes(){ #FUNÇÃO DE ATUALIZAÇÃO 
	

 while [ "$while_do_instalador" = "1" ]; do   #Perguntas para iniciar o processo# 

	if sudo apt-get update -y | grep "Todos os pacotes estão atualizados."# verifica se o sistema está atualizado#
	then
		echo "Seu sistema já está totalmente atualizado. Processo de atualização foi terminado" #finaliza o processo#

		break
		else
		echo "Deseja atualizar um pacote especifico? s/n" #Pergunta se usuario quer um pacote especifico para atualizar
		read atualizar_pacote_especifico

                        echo

			if [ "$atualizar_pacote_especifico" = "s" ] #verifica se o usuario quer atualizar#
			then
				echo "Digite o nome do pacote" #Recebe o pacote especifico#

				read pacote_especifico

				echo

				if apt-cache show "$pacote_especifico" > /dev/null 2>&1  #verifica se escreveu certo#

				then

					sudo apt-get upgrade -y "$pacote_especifico" #atualiza pacote especifoco

					echo

					echo "Atualização feita com sucesso"

					echo

					echo "Deseja atualizar o sistema? s/n" #Recebe se usuario que atualizar o sistema como todo#

					echo

					read sistema_atualizar
						
					if [ "$sistema_atualizar" = "s"] #Atualiza o sistema ou termina o processo esse processo#
					then
						sudo apt update -y && sudo apt-get upgrade -y #Atualiza o sistema

						echo 

                                                #Termina esse processo#

						echo "Atualização no sistema completa. Processo de atualização concluida."

						break 

					else
						
						echo "Processo de atualização concluida. Processo de atualização concluida"

                                                  #Termina o processo#

						break
					fi
				else 
	                                   
					#Avisa o erro para usuario, pois, ele erro nome do pacote#

					echo "Erro... Provavelmente errou a digitaçõa. Digite novamente" 
				fi
			else
				sudo apt update -y && sudo apt upgrade -y #Atualiza o sistem#
				
				echo

				echo "Sistema atualizado. Processo de atualização concluida" #Termina esse processo#

				break
			fi	
		fi
	done	
	 }

	
 funcao_remocao_de_pacotes() {  # FUNÇÃO DE REMOVERA PACOTES#

	contador_da_remocao=1

    while [ "$contador_da_remocao" = "1" ]; do  # Loop que mantém o processo ativo até o usuário sair

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


funcao_limpeza_no_sistema () {  #FUNÇÃO DE LIMPEZA DO CACHE/SISTEMA 

	echo "Nesse processo vai conter a limpeza do sistema"  
	
	echo  

	echo "Deseja realizar a limpeza das dependências não usadas? (s/n)"  
	
	read limpezas_das_dependencias  # Armazena a resposta do usuário

	echo

	# Verifica se o usuário quer limpar dependências
	if [ "$limpezas_das_dependencias" = "s" ]
	then

		# Simula a limpeza (sem executar) para ver se há algo para remover
		if sudo apt-get autoremove -n | grep "0 a serem removidos" > /dev/null 2>&1
		then	
			echo "Não há nada para limpar. O processo será encerrado"  # Caso não tenha nada

		else
 			sudo apt-get autoremove  # Remove dependências não usadas

			echo
			
			echo "Limpeza de dependências concluída"  # Mensagem de sucesso

		fi
	fi

	# Pergunta sobre limpeza de pacotes antigos
	echo "Deseja realizar a limpeza de programas não usados? (s/n)"
	
	read limpezas_dos_programas  # Lê resposta

	# Verifica resposta
	if [ "$limpezas_dos_programas" = "s" ]
	then
		sudo apt-get autoclean  # Remove pacotes antigos do cache
	
		echo
		
		echo "Se nada aconteceu, o sistema não precisava remover pacotes"  # Explicação
 
	fi	

	# Pergunta sobre limpeza total do cache
	echo "Deseja realizar a limpeza do cache? (s/n)"
	
	read limpeza_do_cache  # Lê resposta

	# Verifica resposta
	if [ "$limpeza_do_cache" = "s" ]
	then
		sudo apt-get clean  # Remove TODO o cache de pacotes

		echo
		
		echo "Limpeza do cache concluída"  # Mensagem final
		
		echo
	fi

	echo "Processo de limpeza terminado"  # Final do script
}



echo "Oi, o quê deseja: "

echo

#Nessas perguntas o que o usuario deseja: atualizar, remover, instalar, ver informações e limpar o sistema#

echo "digite 's' para sim e 'n' para não"

echo

while [ "$contador_do_while" = 1 ] #Loop para as perguntas#
do
	echo "Atualizar o sistema? s/n" 

	read atualizar_o_sistema

	if [ "$atualizar_o_sistema" = "s" ] 
	then
		atualizar_os_pacotes
	fi
	
	echo
	
	echo "Instalar pacotes? s/n"

	read instalar_pacotes
	
	if [ "$instalar_pacotes" = "s" ]
	then 
		instalacao_de_pacotes
	fi

	echo
	
	echo "remover pacotes? s/n"

	read remover_pacotes
	
	if [ "$remover_pacotes" = "s" ] 
	then
		funcao_remocao_de_pacotes
	fi

	echo
	
	echo "ver informações de pacotes? s/n"
	
	read informacoes_de_pacotes
	

	if [ "$informacoes_de_pacotes" = "s" ]
	then
		
		funcao_informacao_dos_pacotes

	fi	


	echo
	
	echo "Limpar o sistema? s/n"

	read limpar_o_sistema

	echo
		
	if [ "$limpar_o_sistema" = "s" ]
	then
		funcao_limbezs_no_sistema
	fi
			
	echo

	echo "Deseja refazer as perguntas? s/n"

	read repetir_as_perguntas

	#pergunta para o usuario se quer repetir as perguntas#
	
	if test "$repetir_as_perguntas" = "n"
	then
	
		break

	fi
done
