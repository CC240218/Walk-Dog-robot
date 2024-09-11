                # DOCUMENTAÇÃO DA SUITE
*** Settings ***
Documentation        Suite de teste de cadastro

                # Rota do documento principal para herdar as propriedades do base.resources
Resource    ../resources/base.resource

                # Iniciando e finalizando automaticamente cada caso de teste (base.resources)
Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
deve realizar um cadastro
# Preenchimento dos campos
    [Tags]    cadastro
    # Dicionario comportando uma coleção de dados
    ${dog_walker}    Create Dictionary
    ...    name=Rafael
    ...    email=teste@teste.com
    ...    cpf=10749688408
    ...    cep=53230670
    ...    addressNumber=136
    ...    addressDetails=apt 202
    ...    cnh=toretto.jpg    

    # Caso de teste para acessar uma pagina (propriedade do signup.resource acessado atravez do base.resource)
    go to signup page    Faça seu cadastro

    # Preenchimento dos campos (propriedade do signup.resource acessado atravez do base.resource)
    # Passando o dicionario por paramentro
    Fill signup form     ${dog_walker}

    # enviando o formulario (propriedade do signup.resource acessado atravez do base.resource)
    Submit signup form

    # Validando a aparição do modal de confirmação, passando o texto contido nele por parametro
    # (propriedade do signup.resource acessado atravez do base.resource)
    Popup shoud be    Recebemos o seu cadastro e em breve retornaremos o contato.
    



Nao deve cadastrar com campos vazios
# validação da regra de negocio
    
    # A tag serve para rodar o teste individualmente no Git Bash
    # EX: robot -d ./logs/ -i required tests/signup.robot
    [Tags]    required

    # Caso de teste para acessar uma pagina (propriedade do signup.resource acessado atravez do base.resource)
    go to signup page    Faça seu cadastro

    # enviando o formulario (propriedade do signup.resource acessado atravez do base.resource)
    Submit signup form

    # Acertivas comparando os textos das validações de cada campo e passando cada uma como paramentro para o mesmo caso de teste
    # (propriedade do signup.resource acessado atravez do base.resource)
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)


deve realizar um cadastro com atividade extra de cuidador
# Preenchimento dos campos

    # A tag serve para rodar o teste individualmente no Git Bash
    # EX: robot -d ./logs/ -i A_service tests/signup.robot
    [Tags]    A_service

    # Dicionario comportando uma coleção de dados
    ${dog_walker}    Create Dictionary
    ...    name=Tester
    ...    email=teste@teste.com
    ...    cpf=10749688408
    ...    cep=53230670
    ...    addressNumber=136
    ...    addressDetails=apt 202
    ...    cnh=toretto.jpg    
    ...    adictional_service=Cuidar

    # Caso de teste para acessar uma pagina (propriedade do signup.resource acessado atravez do base.resource)
    go to signup page    Faça seu cadastro

    # Preenchimento dos campos (propriedade do signup.resource acessado atravez do base.resource)
    # Passando o dicionario por paramentro
    Fill signup form     ${dog_walker}

    # clica no componente que possui o seletor que está sendo passado por parametro
    Adictional service    Cuidar

    # enviando o formulario (propriedade do signup.resource acessado atravez do base.resource)
    Submit signup form

    # Validação do modal de confirmação de envio do formulario atravez do texto passado por parametro
    Popup shoud be    Recebemos o seu cadastro e em breve retornaremos o contato.
    


deve realizar um cadastro com atividade de adestrador
# Preenchimento dos campos

    # A tag serve para rodar o teste individualmente no Git Bash
    # EX: robot -d ./logs/ -i A_service tests/signup.robot
    [Tags]    A_service

    # Dicionario comportando uma coleção de dados
    ${dog_walker}    Create Dictionary
    ...    name=Mari
    ...    email=teste@teste.com
    ...    cpf=10749688408
    ...    cep=53230670
    ...    addressNumber=136
    ...    addressDetails=apt 202
    ...    cnh=toretto.jpg    
    ...    adictional_service=Adestrar

     # Caso de teste para acessar uma pagina (propriedade do signup.resource acessado atravez do base.resource)
    go to signup page    Faça seu cadastro

    # Preenchimento dos campos (propriedade do signup.resource acessado atravez do base.resource)
    # Passando o dicionario por paramentro
    Fill signup form     ${dog_walker}

    # clica no componente que possui o seletor que está sendo passado por parametro
    Adictional service    Adestrar
    
    # enviando o formulario (propriedade do signup.resource acessado atravez do base.resource)
    Submit signup form

    # Validação do modal de confirmação de envio do formulario atravez do texto passado por parametro
    Popup shoud be    Recebemos o seu cadastro e em breve retornaremos o contato.
    

deve validar se os dados foram digitados nos campos
# vai comparar os dados dos campos com o texto digitado pelo "Fill signup form"
   [Tags]    validation

    ${dog_walker}    Create Dictionary
    ...    name=Rafael Pereira
    ...    email=teste@teste.com
    ...    cpf=10749688408
    ...    cep=53230670
    ...    addressNumber=136
    ...    addressDetails=apt 202
    ...    cnh=toretto.jpg    

    ${conpare_input}    Create Dictionary
     ...   name=Rafael Pereira
    ...    email=teste@teste.com
    ...    cpf=10749688408
    ...    cep=53230670    
    ...    addressStreet=Praça Expedicionário Brasileiro
    ...    addressNumber=136
    ...    addressDetails=apt 202
    ...    addressDistrict=Jardim Brasil
    ...    addressCityUf=Olinda/PE

    go to signup page    Faça seu cadastro
    Fill signup form     ${dog_walker}
    Asserts signup complete    ${conpare_input}