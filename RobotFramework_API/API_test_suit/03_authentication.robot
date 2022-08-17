*** Settings ***
Test Setup        create session    API_testing    ${base_url2}
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

*** Variables ***
${base_url2}       https://simple-books-api.glitch.me
${token}           Bearer 8beb56b69f51a4794b24e8380a80c9aa5727f9de27daec76e0a32afea9a69a0c


*** Test Cases ***
Get Authetication Token
    [Tags]  gettoken
    ${body_token}=    create dictionary    clientName=Postman4    clientEmail=pakwan4@example.com
    ${header_token}=    create dictionary    Content-Type=application/json
    ${get_token}=   post request  API_testing   url=/api-clients    data=${body_token}    headers=${header_token}
    log to console    ${get_token.status_code}
    log to console    ${get_token.content}

# write on terminal: robot --include=gettoken   API_test_suit/03_authentication.robot
# token =

Post order
    [Tags]  postorder
    ${body_order}=    create dictionary    bookId=1    customerName=Wan
    ${header_order}=    create dictionary  Authorization=${token}     Content-Type=application/json
    ${post_order}=   post request  API_testing   url=/order    data=${body_order}    headers=${header_order}
    log to console    ${post_order.status_code}
    log to console    ${post_order.content}

# write on terminal: robot --include=postorder  -d API_test_suit/Output API_test_suit/03_authentication.robot


