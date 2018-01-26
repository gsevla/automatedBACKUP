# automatedBACKUP
Projeto de CLP(2017.1) - s3

# Script de Backup Automatizado

Exatamente o que o nome propõe, após a execução do script ele será executado diariamente no horário indicado pelo usuário.

## Introdução

### 1. Como funciona o script

Por meio da indicação de um local de origem, um local de destino e uma hora(de 0 a 23).

Primeiramente serão realizadas algumas verificações, a fim de ter a certeza de que o usuário executou corretamente o script. As verificações consistem em:
	1. Verificar se o usuário entrou com um local de origem válido.
	2. Verificar se o usuário entrou com quantidade de parâmetros correta.
		OBS: Caso o usuário não entre com um local de destino, o backup será feito para o local em que o script está armazenado.

O script fará, então, o backup do arquivo ou pasta, o(a) salvando no local de destino(criando toda a raiz de destino caso necessário).

Após os procedimentos supracitados, o script criará uma rotina automática de backup no crontab.
	OBS: Rotinas no crontab apenas podem ser criadas pelo superuser(root).

### 2. Informações

O script foi construído completamente em BASH, mas pode ser compatível com alguns outros SH's sem a necessidade de realizar muitas alterações(apenas sintáticas em sua grande maioria).

Apesar de haver a possibilidade de usuários comuns criarem algumas rotinas no crontab, por meio do comando: 
	crontab -e
no terminal, não é usual que eles possam criar rotinas de backup e, por isso, este script deve ser utilizado apenas pelo superuser, pois a rotina é adicionada diretamente ao arquivo principal /etc/crontab.

## 3. Executando o script

1. É necessário, primeiramente, dar todas as permissões ao script. Para isso, se utiliza no terminal: 
	chmod +x [basename]
sendo basename o nome do script.
	OBS: O comando chmod deve ser executado na pasta onde o script está contido.

2. Ainda no terminal, entre com: 
	sudo ./[basename] [origem] [destino] [hora]
	OBS: Aqui será necessário você entrar com a senha do superuser.

Caso você obedeça o que foi dito neste arquivo, tudo OK, seu script já foi executado e automatizado.

## 4. Principais problemas

1. Você esqueceu de usar dar as permissões ao arquivo.
2. Você não fez a passagem de parâmetros corretamente.
3. Você indicou um local de origem inexistente.
4. Você não é o superuser.
5. Conte-me ;).

## 5. Agradecimentos

Gostaríamos de agradecer principalmente ao fórum Viva o Linux e seus usuários, que foram os principais meios utilizados para o aprendizado da linguagem e para a construção do script.

## 6. Referências

http://www.mundoubuntu.com.br/dicas/comandos/133-compactando-descompactando-arquivos-tar-gz
https://help.ubuntu.com/lts/serverguide/serverguide.pdf
https://www.vivaolinux.com.br/artigo/Backup-automatico-em-Shell-Script
https://www.vivaolinux.com.br/dica/Funcoes-em-Shell-Script
https://www.vivaolinux.com.br/dica/Shell-script-Variaveis-especiais
https://www.vivaolinux.com.br/dica/Passagem-de-parametros-para-funcoes-shell-script
https://www.vivaolinux.com.br/artigo/Usando-cron-e-crontab-para-agendar-tarefas?pagina=1
https://stackoverflow.com/questions/8467424/echo-newline-in-bash-prints-literal-n/8467448
https://www.devmedia.com.br/introducao-ao-shell-script-no-linux/25778
http://tldp.org/LDP/Bash-Beginners-Guide/html/index.html:
	http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-6.html
	http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
http://shellscriptx.blogspot.com.br/2016/12/estrutura-condicional-if-then-elif-else-fi.html
http://blog.saulostopa.com/script-backup-automatico-crontab/
http://pubs.opengroup.org/onlinepubs/9699919799/utilities/contents.html: 
	http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09
	http://pubs.opengroup.org/onlinepubs/9699919799/utilities/crontab.html#tag_20_25
http://www.devin.com.br/crontab/
https://www.inf.ufes.br/~vitorsouza/wp-content/uploads/teaching-lp-20132-seminario-shell.pdf
