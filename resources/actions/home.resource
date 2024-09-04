                # DOCUMENTAÇÃO Do script
*** Settings ***
Documentation    Confirmar acesso a homePage

                # Ambiente do teste
Library    Browser

                
*** Keywords ***

Deve verificar se a home está online

    [Arguments]    ${text}
    # Asserts de comparação para confirmar se a home está de fato online atravéz de seu texto h1
    Get Text    h1    equal   ${text}