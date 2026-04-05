#! /bin/bash
teste_de_pacotes(){
	while_do_instalador=1 #Para iniciar o while#

 	while [ "$while_do_instalador" = "1" ]; do   #Perguntas para iniciar o processo#  
 		echo "Vai quere instalar qual pacote?" #Pergunta para usuario qual pacote instalar#

        	read pacote_do_usuario  #Váriavel com valor do nome do pacote#

		
		if  apt-cache show "$pacote_do_usuario" > /dev/null 2>&1 
		then
			if dpkg -l | grep "$pacote_do_usuario" > /dev/null 2>&1
			then
				echo "Você já possui esse pacote" 
				break
			fi

			apt show $pacote_do_usuario
			
			echo
			
			echo "Esse é pacote que está procurando? (s/n)"
			
			read resposta_do_usuario
			
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
		else
			echo "Erro. Provalvelmente foi erro de digitação"	
		fi	
	done	
	 }
teste_de_pacotes
echo "Saiu do loop"
