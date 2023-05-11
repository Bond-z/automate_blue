import xml.etree.ElementTree as ET
import datetime
import time
import pandas as pd
import os
from dotenv import load_dotenv

resource_path_01 = '../report/func_01/output_01.xml'
resource_path_02 = '../report/func_02/output_02.xml'

paths = [resource_path_01, resource_path_02]
file_name = ['func01', 'func02']
index = 0

date_time = datetime.datetime.now()

# tree = ET.parse(resource_path_01)
# root = tree.getroot()

def get_TestCaseName(root):

    TestCaseName = [] 
    
    for item in root[0].findall('test'):
        
        title = item.attrib["name"]
        TestCaseName.append(title)

    return TestCaseName

def get_Result(root):
    testcaseId = []
    result = []

    for item in root.findall('./statistics/tag/stat'):
        
        testcase_id = item.text
        status_pass = item.attrib["pass"]
        status_fail = item.attrib["fail"]

        try:
            if status_pass == "1":
                testcaseId.append(testcase_id)
                result.append("pass")
          
            elif status_fail == "1":
                testcaseId.append(testcase_id)
                result.append("fail")
                
        except Exception as e:
            print('Error: ', str(e))
    
    df = pd.DataFrame(testcaseId, columns=['ID'])
    test_result = df.assign(Results = result)        

    return test_result


if __name__ == '__main__':

    # csv_file = 'report_' + str(date_time.strftime('%Y_%m_%d_%H_%M_%S')) + '.csv'
    
    # testcase = get_TestCaseName()
    # result = get_Result()

    # print(result)
    # time.sleep(1)
    # result.insert(1, "Tese Cases", testcase, allow_duplicates=True)
    # result.sort_values(by=['ID'], axis=0, ascending=True)
    # result.to_csv(csv_file)

    for file_path in paths:
        file = file_name[index]
        index = index + 1

        # data = ET.parse(file_path).getroot()
        tree = ET.parse(file_path)
        root = tree.getroot()

        testcase = get_TestCaseName(root)
        result = get_Result(root)

        time.sleep(1)
        result.insert(1, "Test Cases", testcase, allow_duplicates=True)
        result.sort_values(by=['ID'], axis=0, ascending=True)

        csv_file = './csv_report/output_' + file + '.csv'

        result.to_csv(csv_file)
        print(result)
    
