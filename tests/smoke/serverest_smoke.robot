*** Settings ***
Resource    ../../resources/variables/dev.resource
Resource    ../../resources/keywords/api.resource
Resource    ../../resources/keywords/data.resource
Suite Setup    Create ServeRest Session    ${BASE_URL}

*** Test Cases ***
Status page is reachable (local only)
    [Tags]    local-only
    ${resp}=    GET ServeRest    /status    200

ServeRest can list users
    ${resp}=    GET ServeRest    /usuarios    200

ServeRest can list products
    ${resp}=    GET ServeRest    /produtos    200

ServeRest can list carts
    ${resp}=    GET ServeRest    /carrinhos    200

ServeRest can create a user
    ${body}=    Generate User Body
    ${resp}=    POST ServeRest    /usuarios    ${body}    201

ServeRest can login
    ${body}=    Generate Login Body
    ${resp}=    POST ServeRest    /login    ${body}    200