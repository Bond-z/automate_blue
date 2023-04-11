*** Settings ***
Resource   ${CURDIR}/../import.robot

*** Test Cases ***
Testcase 01 is correct
    [Tags]   1_1   func
    ${output}=    Convert To Number    5
    ${number}   Evaluate   4 + 1
    Should Be Equal    ${output}    ${number} 

Testcase 02 is correct
    [Tags]   1_2    func
    ${output}=    Convert To Number    10
    ${number}   Evaluate   5 + 5
    Should Be Equal    ${output}    ${number} 