*** Settings ***
Library    FakerLibrary

*** Keywords ***
Generate User Body
    ${email}=    FakerLibrary.Email
    ${body}=    Create Dictionary
    ...    nome=Usuario Teste
    ...    email=${email}
    ...    password=teste123
    ...    administrador=false
    RETURN    ${body}

Generate Login Body
    ${body}=    Create Dictionary
    ...    email=fulano@qa.com
    ...    password=teste
    RETURN    ${body}