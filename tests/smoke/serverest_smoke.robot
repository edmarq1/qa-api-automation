*** Settings ***
Resource    ../../resources/variables/dev.resource
Resource    ../../resources/keywords/api.resource

Suite Setup    Create ServeRest Session    ${BASE_URL}

*** Test Cases ***
Status page is reachable (local only)
    [Tags]    local-only
    ${resp}=    GET ServeRest    /status    200

ServeRest can list users
    ${resp}=    GET ServeRest    /usuarios    200
    Should Be Equal As Numbers    ${resp.status_code}    200
