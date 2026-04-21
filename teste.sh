#! /bin/bash 

echo "Digite um pacote" 
read pacote

atualizacao=$( apt-cache policy "$pacote" | grep "Candidato:" )
sistema_atual=$( apt-cache policy "$pacote" | grep "Instalado:" ) 

if [ "$atualizacao" = "$sistema_atual" ]
then
	echo "Estavel"

else
	echo "É preciso atualizar" 
fi

