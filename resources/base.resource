*** Settings ***
Documentation    Arquivo principal do projeto

Library    Browser
Library    JSONLibrary
Library    Collections

Resource    env.resource
Resource    actions/signup.resource
Resource    actions/home.resource

*** Keywords ***

Start session
    New Browser    browser=${BROWSER}    headless=False
    New Page    https://walkdog.vercel.app

    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo
    ...    visible    5

Get fixtures
    [Arguments]    ${file_name}    ${scenario}

    ${fixture}    Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json     encoding=utf-8 

    RETURN  ${fixture}[${scenario}]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    }]


Finish session
    Take Screenshot    fullPage=True