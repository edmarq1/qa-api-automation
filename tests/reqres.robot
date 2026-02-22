*** Settings ***
Library    RequestsLibrary
Suite Setup    Create Session    reqres    https://reqres.in    headers=${DEFAULT_HEADERS}

*** Variables ***
&{DEFAULT_HEADERS}    User-Agent=reqres-qa-tests/1.0    x-api-key=%{REQRES_API_KEY}

*** Test Cases ***
GET lista de usuarios (ReqRes)
    ${resp}=    GET On Session    reqres    /api/users    params=page=2    expected_status=200
    Should Be Equal As Numbers    ${resp.status_code}    200
