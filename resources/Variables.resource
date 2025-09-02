*** Settings ***
Documentation        Arquivo de variaveis usadas em todos os testes

Library    FakerLibrary

*** Variables ***
${NAME}
${EMAIL}
${PASSWORD}
${PASSWORD_CONFIRMATION}    =    ${PASSWORD}
${WITH_BALANCE}    =    True
${ACCOUNT_NUMBER}


*** Keywords ***
Generate data for registration
    ${NAME}=  FakerLibrary.Name
    ${EMAIL}=    FakerLibrary.Email
    ${PASSWORD}=    FakerLibrary.Password
    Set Suite Variable    ${NAME}
    Set Suite Variable    ${EMAIL}
    Set Suite Variable    ${PASSWORD}