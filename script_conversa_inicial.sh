#! /bin/bash
#######################################################################################################################################
#                                                                                                                                     #
#	 CONVERSA INICIAL PARA INTERAGIR COM USUARIO. NESSE DE ARQUIVO VAI CONTER AS PERGUNTAS E RESPOSTAS DESSAS PERGUNTA	      ##	PARA EXECUTAR OS PROCESSO DE PACOTES. SENDO ESSES PROCESSO: ATUALIZAR O SISTEMA, INSTALAR PACOTES, REMOVER PACOTES,          #
#	 INFORMAÇÕES DOS PACOTES E LIMPAR O SISTEMA.                                                                                  #
#                                                                                                                                     #
#######################################################################################################################################
contador_do_while=1 #Vai permite que o loop aconteçar para as perguntas para executar os processos de pacotes#


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
		#Colocar a função
	fi
	
	echo
	
	echo "Instalar pacotes? s/n"

	read instalar_pacotes
	
	if [ "$instalar_pacotes" = "s" ]
	then 
		#colocar função
	fi

	echo
	
	echo "remover pacotes? s/n"

	read remover_pacotes
	
	if [ "$remover_pacotes" = "s" ] 
	then
			#Colocar a função#
	fi

	echo
	
	echo "ver informações de pacotes? s/n"
	
	read informacoes_de_pacotes
	
		#Colocar a função

	echo
	
	echo "Limpar o sistema? s/n"

	read limpar_o_sistema

	echo
		
	if [ "$limpar_o_sistema" = "s" ]
	then
		#Colocar função"
	fi
			
	echo

	echo "Deseja refazer as perguntas? s/n"

	read repetir_as_perguntas

	#pergunta para o usuario se quer repetir as perguntas e coloca o valor das váriavel para nada#
	
	if test "$repetir_as_perguntas" = "n"
	then
	
		break

	fi
done
