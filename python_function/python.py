import xml.etree.ElementTree as ET
import datetime
import time
import pandas
import os
from dotenv import load_dotenv

resource_path_01 = '../report/output_01.xml'
resource_path_02 = '../report/output_02.xml'

date_time = datetime.datetime.now()

tree = ET.parse(resource_path_01)
root = tree.getroot()

def get_TestCaseName():

    TestCaseName = [] 
    
    for item in root[0].findall('test'):
        
        title = item.attrib["name"]
        TestCaseName.append(title)

    return TestCaseName

def get_Result():
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
    
    df = pandas.DataFrame(testcaseId, columns=['ID'])
    test_result = df.assign(Results = result)        

    return test_result


if __name__ == '__main__':

    csv_file = 'report_' + str(date_time.strftime('%Y_%m_%d_%H_%M_%S')) + '.csv'
    
    testcase = get_TestCaseName()
    result = get_Result()

    print(result)
    time.sleep(1)
    result.insert(1, "Tese Cases", testcase, allow_duplicates=True)
    result.sort_values(by=['ID'], axis=0, ascending=True)
    result.to_csv(csv_file)
    
