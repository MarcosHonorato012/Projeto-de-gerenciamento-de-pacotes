#! /bin/bash
######################################################################################################################################
#                                                                                                                                    #
#                                                                                                                                    #
#                 NESSE CODIGO VAI CONTER AUTOMAÇÃO DE ATUALIZAR O SISTEMA E UM PACOTE ESPECIFICO.                                    #
#                                                                                                                                    #
#                                                                                                                                    #
#                                                                                                                                    #
#                                                                                                                                    #
######################################################################################################################################
atualizar_os_pacotes(){
	while_do_instalador=1 #Para iniciar o while#

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
atualizar_os_pacotes
