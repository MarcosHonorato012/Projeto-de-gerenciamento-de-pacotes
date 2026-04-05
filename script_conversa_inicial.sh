#! /bin/bash
#######################################################################################################################################
#                                                                                                                                     #
#	 CONVERSA INICIAL PARA INTERAGIR COM USUARIO. NESSE DE ARQUIVO VAI CONTER AS PERGUNTAS E RESPOSTAS DESSAS PERGUNTA	      ##	PARA EXECUTAR OS PROCESSO DE PACOTES. SENDO ESSES PROCESSO: ATUALIZAR O SISTEMA, INSTALAR PACOTES, REMOVER PACOTES,          #
#	 INFORMAÇÕES DOS PACOTES E LIMPAR O SISTEMA.                                                                                  #
#                                                                                                                                     #
#######################################################################################################################################
contador_do_while=1 #Vai permite que o loop aconteçar para as perguntas para executar os processos de pacotes#

contador_dos_processo=0 #Vai realizar cada processo que for adicionado para essa váriavel#

echo "Oi, o quê deseja: "

echo

#Nessas perguntas o que o usuario deseja: atualizar, remover, instalar, ver informações e limpar o sistema#

echo "digite 's' para sim e 'n' para não"

echo

while [ "$contador_do_while" = 1 ] #Loop para as perguntas#
do
	echo "Atualizar o sistema? s/n" 

	read atualizar_o_sistema

	test "$atualizar_o_sistema" = "s" && $(($contador_dos_processo + 1)) #Adiciona mais um para contador dos processo#
	
	echo
	
	echo "Instalar pacotes? s/n"

	read instalar_pacotes
	
	test "$instalar_pacotes" = "s" && $(($contador_dos_processo + 1)) #Adiciona mais um para contador dos processo#


	echo
	
	echo "remover pacotes? s/n"

	read remover_pacotes
	
	test "$remover_pacotes" = "s" && $(($contador_dos_processo + 1)) #Adiciona mais um para contador dos processo#


	echo
	
	echo "ver informações de pacotes? s/n"
	
	read informacoes_de_pacotes
	
	test "$informacoes_de_pacotes" = "s" && $(($contador_dos_processo + 1)) #Adiciona mais um para contador dos processo#


	echo
	
	echo "Limpar o sistema? s/n"

	read limpar_o_sistema

	test "$limpar_o_sistema" = "s" && $(($contador_dos_processo + 1)) #Adiciona mais um para contador dos processo#


	echo

	echo "Deseja refazer as perguntas? s/n"

	read repetir_as_perguntas

	#pergunta para o usuario se quer repetir as perguntas e coloca o valor das váriavel para nada#
	
	if test "$repetir_as_perguntas" = "s"

	then
		echo "As perguntas vão aparecer novamente"
		atualizar_o_sistema=''
		instalar_pacotes=''
		remover_pacotes=''
		informacoes_de_pacotes=''
		limpar_o_sistema=''
		repetir_as_perguntas=''	

