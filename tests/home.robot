                # DOCUMENTAÇÃO DA SUITE
*** Settings ***
Documentation        Suite de teste da home page

                # Rota do documento principal para herdar as propriedades do base.resources
Resource    ../resources/base.resource


                # casos de testes
*** Test Cases ***
Checar home
    # Iniciando o browser pelo 'base.resource'
    Start session 

    # keyword do documento 'home.resource', herdado pelo 'base.resource'
    Deve verificar se a home está online    Cuidado e diversão em cada passo

    # Finalizando o browser pelo 'base.resource'
    Finish session