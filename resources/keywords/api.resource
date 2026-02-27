*** Settings ***
Library    RequestsLibrary
Library    FakerLibrary

*** Keywords ***
Create ServeRest Session
    [Arguments]    ${base_url}
    Create Session    serverest    ${base_url}

GET ServeRest
    [Arguments]    ${path}    ${expected}=200
    ${resp}=    GET On Session    serverest    ${path}    expected_status=${expected}
    RETURN    ${resp}

POST ServeRest
    [Arguments]    ${path}    ${body}=&{EMPTY}    ${expected}=200
    ${resp}=    POST On Session    serverest    ${path}    json=${body}    expected_status=${expected}
    RETURN    ${resp}