*** Settings ***
Documentation        Ações e elementos da pagina de cadastro de conta

Library    Browser
Library    String


*** Keywords ***
Access to register page
    Click    css=button:has-text("Registrar")
    Sleep    5s


Fill registration form with valid data
    [Arguments]    ${NAME}    ${EMAIL}    ${PASSWORD}    ${PASSWORD_CONFIRMATION}    ${WITH_BALANCE}
    Fill Text    xpath=//div[@class='card__register']//input[@type='email' and @placeholder='Informe seu e-mail']    ${EMAIL}
    Fill Text    css=input[type="name"]    ${NAME}
    Fill Text    xpath=//div[@class='card__register']//input[@type="password" and @placeholder="Informe sua senha"]    ${PASSWORD}
    Fill Text    xpath=//input[@type="password" and @placeholder="Informe a confirmação da senha"]    ${PASSWORD_CONFIRMATION}

    IF    ${WITH_BALANCE} == True
        Click    id=toggleAddBalance
        Click    css=button:has-text("Cadastrar")
    ELSE
        Click    css=button:has-text("Cadastrar")
    END


Registration success message is displayed
    Wait For Elements State    id=modalText    visible    timeout=5s
    ${message}=    Get Text    id=modalText
    Validate message in modal in success registration    ${message}
    Sleep    10s

Validate message in modal in success registration
    [Arguments]    ${message}
    Should Match Regexp    ${message}    A conta (.+) foi criada com sucesso

    #Extrair numero da conta usando regexp
    Extract account number from success message    ${message}

Extract account number from success message
    [Arguments]    ${message}
    ${account_number}=    Get Regexp Matches    ${message}    A conta (\d+-\d+) foi criada com sucesso

    Run Keyword If    ${account_number}    Set Global Variable    ${ACCOUNT_NUMBER}    ${account_number[0]}
    ...    ELSE    Fail    Número da conta não encontrado!
    
    Log    Número da conta extraído: ${ACCOUNT_NUMBER}