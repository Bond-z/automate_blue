
*** Keywords ***
Open web browser
    SeleniumLibrary.Open browser    ${url}   gc
    SeleniumLibrary.Wait Until Element Is Visible    ${dict_page.tab_add_item}

​​Open responsive web browser with chrome
   SeleniumLibrary.Open browser    ${url}   gc
   SeleniumLibrary.Set Window Size    ${WIDTH_MOB_WEB}    ${HEIGHT_MOB_WEB}
    

Add new to do list item
    [Arguments]    @{tasks}
    FOR    ${task}    IN    @{tasks}
        Input Text    ${dict_page.txt_add_item}    ${task}  
        Click Element    ${dict_page.btn_add}
    END

Verify first task should be displayed on the top
    [Arguments]    @{tasks}
    Click Element    ${dict_page.tab_todo_tasks}
    ${ele}    Format Text  ${dict_page.tasks}      $task_no=1
    Element Should Contain    ${ele}    ${tasks}[0]

Verify the item is already added into to do taks successfully
    [Arguments]    @{tasks}
    Click Element    ${dict_page.tab_todo_tasks}

    ${len}    Get Length    ${tasks}
    FOR    ${task}    IN RANGE    ${len}
        ${ele}    Format Text  ${dict_page.tasks}      $task_no=${task+1}
        Element Should Contain    ${ele}    ${tasks}[${task}]
    END

Finish the task in TO DO TASKS
    Click Element    ${dict_page.tab_todo_tasks}
    SeleniumLibrary.Wait Until Element Is Visible    ${dict_page.checkbox_complete}
    ${count}=  SeleniumLibrary.Get Element Count    ${dict_page.txt_tasks_list}
    FOR    ${task}    IN RANGE    ${count} 
        Click Element  ${dict_page.checkbox_complete}     
    END 

Delete first task
    Click Element    ${dict_page.tab_todo_tasks}
    Click Element    ${dict_page.btn_delete_task}

Delete all tasks
    Click Element    ${dict_page.tab_todo_tasks}
    ${count}=  SeleniumLibrary.Get Element Count    ${dict_page.txt_tasks_list}
    FOR    ${task}    IN RANGE    ${count}
        Click Element    ${dict_page.btn_delete_task}
    END

Verify to do task is empty when all tasks has been deleted
    [Arguments]    @{tasks}
    Click Element    ${dict_page.tab_todo_tasks}
    ${ele}    Format Text  ${dict_page.tasks}      $task_no=1
    Element Should Not Be Visible    ${ele}

Verify items in COMPLETED tasks
    [Arguments]    @{tasks}
    Click Element    ${dict_page.tab_completed}
    ${count}=  SeleniumLibrary.Get Element Count    ${dict_page.completed_tasks_list}
    FOR   ${index}   IN RANGE    ${count}
        ${ele}    Format Text  ${dict_page.completed_tasks}      $task_no=${index+1}
        Element Should Contain    ${ele}    ${tasks}[${index}]
    END
    
Delete all completed tasks
    Click Element    ${dict_page.tab_completed}
    ${count}=  SeleniumLibrary.Get Element Count    ${dict_page.completed_tasks_list}
    FOR   ${index}   IN RANGE    ${count}
        Click Element    ${dict_page.btn_delete_completed_tasks}
    END

Verify completed task should be empty
    Element Should Not Be Visible    ${dict_page.btn_delete_completed_tasks}

Format Text
    [Arguments]    ${format_string}    &{key_value_pairs}
    ${key_value_pairs}=     Collections.Convert To Dictionary    ${key_value_pairs}
    ${result_text}    Evaluate    unicode($format_string).format(**$key_value_pairs) if sys.version_info.major==2 else str($format_string).format(**$key_value_pairs)    modules=sys
    [Return]    ${result_text}

Delete Task2
    Click Element    ${dict_page.btn_delete_task2}

Verify task1 and task3 are remain
    Element Should Contain    ${dict_page.ele_task1}    Task1
    Element Should Contain    ${dict_page.ele_task3}    Task3
