*** Settings ***
Resource   ${CURDIR}/../import.robot
Test Setup    todo_list_keywords.​​Open responsive web browser with chrome
# Test Teardown    SeleniumLibrary.Close window

*** Variables ***
${url}    https://abhigyank.github.io/To-Do-List/
@{tasks}    Task1    Task2    Task3

*** Test Case ***
Verify Todo List website can be able to add to-do tasks successfully
    [Tags]   tc1
    Add new to do list item    @{tasks}  
    Verify the item is already added into to do taks successfully    @{tasks}
    Verify first task should be displayed on the top    @{tasks}

Verify incomplete task can be deleted successfully
    [Tags]   tc2
    Add new to do list item    @{tasks}
    Delete all tasks
    Verify to do task is empty when all tasks has been deleted     

Verify tasks can be added into COMPLETED when tick in check box
    [Tags]   tc3
    Add new to do list item    @{tasks}  
    Finish the task in TO DO TASKS
    Verify items in COMPLETED tasks    @{tasks} 

Verify COMPLETED tasks should be empty when all items has been deleted
    [Tags]   tc4
    Add new to do list item    @{tasks}  
    Finish the task in TO DO TASKS
    Verify items in COMPLETED tasks    @{tasks}
    Delete all completed tasks
    Verify completed task should be empty

Verify take1 and task3 are ramaining 
    [Tags]   tc5
    Add new to do list item    @{tasks}  
    Verify the item is already added into to do taks successfully    @{tasks}
    Delete any tasks     task7
    Verify task1 and task3 are remain


    
    
    