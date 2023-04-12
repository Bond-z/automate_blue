*** Settings ***
Resource   ${CURDIR}/../../import.robot

*** Test Cases ***
Testcase 01 is correct
    [Tags]   func
    ${output}=    Convert To Number    5
    ${number}   Evaluate   4 + 1
    Should Be Equal    ${output}    ${number} 

Testcase 02 is correct
    [Tags]   func
    ${output}=    Convert To Number    10
    ${number}   Evaluate   5 + 5
    Should Be Equal    ${output}    ${number} 