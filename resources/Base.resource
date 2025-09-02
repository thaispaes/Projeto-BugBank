*** Settings ***
Documentation        Keywords personalizadas que são base para vários testes 

Library    Browser

Resource    ./pages/Extract.resource
Resource    ./pages/Home.resource
Resource    ./pages/Login.resource
Resource    ./pages/Register.resource
Resource    ./pages/Transfer.resource
Resource    Variables.resource

*** Variables ***
${URL}    https://bugbank.netlify.app/

*** Keywords ***

Open site
    New Browser    headless=False
    New Page    ${URL}

