*** Settings ***
Library    SeleniumLibrary 
Library    String 
Library    Collections

Resource   ${CURDIR}/keyword/todo_list_keywords.robot
Resource   ${CURDIR}/resources/xpath.robot

Variables   ${CURDIR}/resources/test_configs.yaml
