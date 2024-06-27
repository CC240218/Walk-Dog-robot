                # DOCUMENTAÇÃO do script
*** Settings ***
Documentation    Acões, steps e elementos da funcionalidade de cadastro

                # Ambiente de execução
Library    Browser

*** Keywords ***

go to signup page
# Indo até a pagina signup e realizando uma acertiva para confirmar o direcionamento

    # O click no botão, para acessar a pagina desejada
    Click    css=a[href="/signup"]    
    
    # Aguardando determinado elemento da pagina por segundos expecificados
    Wait For Elements State    form h1    visible    5000

    # Realizando um assert de comparação com o texto do elemento
    Get Text    form h1    equal    Faça seu cadastro

Fill signup form
# Preenchimentos dos campos e busca do CEP

    # Este argumeto é um dicionario Python, criado no 'signup.robot' para conter várias informações em uma variavel
    [Arguments]    ${dog_walker}

    # Preenchendo os campos atravez do '[Arguments]  ${dog_walker}' passando o dado de acordo com o input
    Fill Text    css=input[name=name]    ${dog_walker}[name]
    Fill Text    css=input[name=email]   ${dog_walker}[email]
    Fill Text    css=input[name=cpf]    ${dog_walker}[cpf]
    Fill Text    css=input[name=cep]    ${dog_walker}[cep]

    # Clicando em um botão e solicitando um aguardo de 3 segundos
    Click        css=input[type=button][value="Buscar CEP"]
    Sleep    3

    # Preenchendo os campos atravez do '[Arguments]  ${dog_walker}' passando o dado de acordo com o input
    Fill Text    css=input[name=addressNumber]    ${dog_walker}[addressNumber]
    Fill Text    css=input[name=addressDetails]    ${dog_walker}[addressDetails]
    
    # click e upload de um arquivo    atravez do EXECDIR, que serve para resumir o caminho 'Raiz' do projeto, 
    # concatenado com o caminho do arquivo dentro do projeto
    Upload File By Selector    css=input[type=file]   ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]

Adictional service
# Atividades não obrigatorias


    # Parametro
    [Arguments]    ${adictional_service}

    # click em um componente com o seletor em XPath recebendo um parametro para deixa-lo gerenico
    Click    xpath=//span[text()="${adictional_service}"]/..   

Asserts signup complete
# acertivas para confirmar os campos preenchidos

   [Arguments]    ${conpare_input}

    Get Text     css=input[name=name]            equal    ${conpare_input}[name]
    Get Text    css=input[name=email]            equal    ${conpare_input}[email]
    Get Text    css=input[name=cpf]              equal    ${conpare_input}[cpf]
    Get Text    css=input[name=cep]              equal    ${conpare_input}[cep]
    Get Text    css=input[name=addressStreet]    equal    ${conpare_input}[addressStreet]
    Get Text    css=input[name=addressNumber]    equal    ${conpare_input}[addressNumber]
    Get Text    css=input[name=addressDetails]   equal    ${conpare_input}[addressDetails]
    Get Text    css=input[name=addressDistrict]  equal    ${conpare_input}[addressDistrict]

Submit signup form
# Envio do formulario

    Click    css=.button-register

Popup shoud be
# Validação do modal de confirmação de envio do formulario

    # Parametro 
    [Arguments]    ${expected_text}

    # Aguradar o elemento por 5 segundos
    Wait For Elements State    css=.swal2-html-container    visible    5

    # Assertiva de comparação com o dado do parametro que será passado no 'signup.robot'
    Get Text    css=.swal2-html-container    equal    ${expected_text}
    Sleep    3


Alert should be
# Acertiva que recebe o parametro e aguarda o mesmo aparecer em tela.

    # Parametro
    [Arguments]    ${expected_text}

    # Espera um alerta de erro do browser cujo seu texto é igual ao que for paSsado no parametro.
     Wait For Elements State    
     ...    css=.alert-error >> text=${expected_text}    visible    5