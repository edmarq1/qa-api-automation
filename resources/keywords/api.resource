*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Create ServeRest Session
    [Arguments]    ${base_url}
    Create Session    serverest    ${base_url}

GET ServeRest
    [Arguments]    ${path}    ${expected}=200
    ${resp}=    GET On Session    serverest    ${path}    expected_status=${expected}
    RETURN    ${resp}
