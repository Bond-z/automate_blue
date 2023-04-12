*** Settings ***
Resource   ${CURDIR}/../../import.robot

*** Test Cases ***
This Testcase Should Be True
    [Tags]   two
    ${output}=    Convert To Number    5
    ${number}   Evaluate   3 + 2
    Should Be Equal    ${output}    ${number} 

This Testcase Should Not Be True 
    [Tags]   two
    ${output}=    Convert To Number    10
    ${number}   Evaluate   4 + 1
    Should Be Equal    ${output}    ${number} 