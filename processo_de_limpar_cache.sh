#!/bin/bash  

##################################################################################################################################
#
#   NESSE PROCESSO VAI CONTER A LIMPEZA DO SISTEMA USANDO AUTOREMOVE, AUTOCLEAN E CLEAN.
#
##################################################################################################################################

funcao_limpeza_no_sistema () {  

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

funcao_limpeza_no_sistema  
