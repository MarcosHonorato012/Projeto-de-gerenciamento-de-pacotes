#! /bin/bash
teste_de_pacotes(){
	while_do_instalador=1 #Para iniciar o while#

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
teste_de_pacotes
