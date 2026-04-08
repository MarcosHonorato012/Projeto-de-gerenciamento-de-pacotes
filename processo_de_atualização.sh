#! /bin/bash
atualizar_os_pacotes(){
	while_do_instalador=1 #Para iniciar o while#

 	while [ "$while_do_instalador" = "1" ]; do   #Perguntas para iniciar o processo# 

		if sudo apt-get update -y | grep "Todos os pacotes estão atualizados."
		then
			echo "Seu sistema já está totalmente atualizado. Processo de atualização foi terminado"

			break
		else
			echo "Deseja atualizar um pacote especifico? s/n"

			read atualizar_pacote_especifico

                        echo

			if [ "$atualizar_pacote_especifico" = "s" ]
			then
				echo "Digite o nome do pacote"

				read pacote_especifico

				echo

				if apt-cache show "$pacote_especifico" > /dev/null 2>&1

				then

					sudo apt-get upgrade -y "$pacote_especifico"

					echo "Atualização feita com sucesso"

					echo

					echo "Deseja atualizar o sistema? s/n"

					echo

					read sistema_atualizar
						
					if [ "$sistema_atualizar" = "s"]
					then
						sudo apt update -y && sudo apt-get upgrade -y

						echo "Atualização no sistema completa. Processo de atualização concluida."
						break

					else
						
						echo "Processo de atualização concluida. Processo de atualização concluida"
						break
					fi
				else 
					echo "Erro... Provavelmente errou a digitaçõa. Digite novamente"
				fi
			else
				sudo apt update -y && sudo apt upgrade -y
				
				echo

				echo "Sistema atualizado. Processo de atualização concluida"

				break
			fi	
		fi
	done	
	 }
atualizar_os_pacotes
