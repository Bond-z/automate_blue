*** Settings ***
Resource   ${CURDIR}/../../import.robot

*** Test Cases ***
This Testcase Should Be True
    [Tags]   2_1    func2
    ${output}=    Convert To Number    5
    ${number}   Evaluate   3 + 2
    Should Be Equal    ${output}    ${number} 

This Testcase Should Not Be True 
    [Tags]   2_2    func2
    ${output}=    Convert To Number    10
    ${number}   Evaluate   4 + 1
    Should Be Equal    ${output}    ${number} 