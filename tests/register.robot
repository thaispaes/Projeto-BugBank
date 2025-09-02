*** Settings ***
Documentation       Arquivo de Caso de testes relacionado a funcionalidade de Cadastro na aplicação 

Resource    ../resources/Base.resource

Suite Setup    Generate data for registration

Test Setup    Open site


*** Test Cases ***
Register in application with success
    [Documentation]    Validar o cadastro na aplicação com sucesso
    Given Access to register page
    When Fill registration form with valid data    ${NAME}    ${EMAIL}    ${PASSWORD}    ${PASSWORD_CONFIRMATION}    ${WITH_BALANCE}
    Then Registration success message is displayed
    