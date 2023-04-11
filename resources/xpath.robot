**** Variables ***
&{dict_page}
...   tab_add_item=xpath=//*[@class="mdl-tabs__tab-bar"]/child::*[text()="Add Item"]
...   txt_add_item=xpath=//*[@id="new-task"]
...   btn_add=xpath=//*[@id="add-item"]/button
...   tab_todo_tasks=xpath=//*[@class="mdl-tabs__tab-bar"]/child::*[text()="To-Do Tasks"]
...   txt_tasks_list=xpath=//*[@id="incomplete-tasks"]/child::*
...   tasks=xpath=//*[@id="incomplete-tasks"]/child::*//*[@id="text-{$task_no}"]
...   checkbox_complete=xpath=//*[@id="incomplete-tasks"]/li[1]/label
...   btn_delete_task=xpath=(//*[@id="incomplete-tasks"]/child::*)[1]/button
...   tab_completed=xpath=//*[@class="mdl-tabs__tab-bar"]/child::*[text()="Completed"]
...   completed_tasks_list=xpath=//*[@id="completed-tasks"]/child::*
...   completed_tasks=xpath=(//*[@id="completed-tasks"]/child::*)[{$task_no}]//*[@class="mdl-list__item-primary-content"]
...   btn_delete_completed_tasks=xpath=//*[@id="completed-tasks"]/child::*/button
...   btn_delete_task2=xpath=(//*[@id="incomplete-tasks"]/child::*)[2]/button
...   task1=xpath=(//*[@id="incomplete-tasks"]/child::*)[1]/button
...   task3=xpath=(//*[@id="incomplete-tasks"]/child::*)[2]/button
...   ele_task1=xpath=//*[@id="text-1"]
...   ele_task3=xpath=//*[@id="text-2"]
