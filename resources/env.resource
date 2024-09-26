                # DOCUMENTAÇÃO DA SUITE
*** Settings ***
Documentation    Variaveis de ambiente

# arquivo criado para manipular o ambiente onde o teste será executado.
*** Variables ***
${BROWSER}    chromium
${HEAD}       False

# O google será por padrão. Porém, poderá ser alterado durante a execução com o seguinte comando
# robot -d ./logs/ -v BROWSER: navegador tests/signup.robot
# navegador = nome do navegador que deseja rodar o teste