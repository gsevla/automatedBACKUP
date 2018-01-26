#!/bin/bash

echo ""
echo "##########################################################"
echo "##							##"
echo "##		    Backup Automatizado			##"
echo "##                        Equipe:			##"
echo "##     Denis Menezes, Gabriel Alves e Matheus Vieira	##"
echo "##							##"
echo "##########################################################"
echo ""
echo ""


basedir="`pwd`/`basename $0`"	# pwd = local e basename $0 = nome do arquivo
origem=$1		# diretório de origem do arquivo
destino=$2		# diretório de destino do arquivo
hora=$3
nomeBackup="`date +%d-%m-%Y--%H-%M`.tar.gz"		#nome do arquivo de backup


function locais() {
	echo -e "Origem: $origem\nDestino: $destino"		# -e é uma flag que serve para interpretar backslashes(\n)
}


echo "Resolvendo endereços..."
sleep 1
locais		# chama locais()
echo ""
echo "Realizando verificações..."
sleep 1


function backup() {
	if [ ! -d "$destino" ]; then		# verifica se a pasta de destino existe
		echo "Resolvendo necessidades..."
		sleep 1
		mkdir -p $destino		# mkdir cria a pasta a tag -p faz com que toda a raiz seja criada caso necessário
	fi
	sleep 1
	echo "Realizando Backup:"
	tar -czvf $destino/$nomeBackup $origem		# compacta o arquivo
	if [ $? -eq 0 ]; then		# verifica qual o retorno da última linha
		sleep 1
		echo "Backup realizado com sucesso!"
		echo ""
		echo "Automatizando processo..."
		sleep 1
		echo "00 $hora * * * root $basedir $origem $destino > /dev/tty10" >> /etc/crontab
		if [ $? -eq 0 ]; then
			sleep 1
			echo "O processo foi automatizado! Digite \"[editor] /etc/crontab\" para verificar."
			exit
		else
			sleep 1
			echo "O processo nao pode ser automatizado! Verifique suas permissoes."
			exit
		fi
	else
		echo "O Backup falhou, abortando script..."
		sleep 1
		exit
	fi
}

function start() {
	if [[ $# -eq 3 && -d "$origem" ]]; then		# verifica se os parâmetros foram passados e se o local de origem existe
		echo "OK"
		echo ""
		backup		# chama backup()
	elif [[ $# -ne 3 && -d "$origem" ]]; then
		echo -e "Passagem de parametros incorreta. Apenas $# parametro(s) foi digitado: $*, abortando script..."
		sleep 1
		echo "Modo de uso: sudo $0 [origem] [destino] [hora]"
		exit
	elif [[ $# -eq 3 && ! -d "$origem" ]]; then
		echo "O diretorio $origem nao existe, abortando script..."
		sleep 1
		exit
	else
		echo "Erro inesperado, abortando script..."
		sleep 1
		exit
	fi
}


start $origem $destino $hora
