*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library    OperatingSystem
Library    CSVLibrary

*** Variables ***
${base_url}  http://localhost:8080

*** Test Cases ***
Uploading_CSv_file_withdata_mentionedin_AC1
    Create Session    mysession    ${base_url}
  ${file_data}=  Get Binary File  ${CURDIR}${/}Datafile.csv
  &{files}=  Create Dictionary  file=${file_data}
    ${resp}=   POST On Session   mysession  calculator/uploadLargeFileForInsertionToDatabase  files=${files}
    Log To Console    ${resp.status_code}
    #to validate status code with the actual status code
     ${Status_code}=  Convert To String   ${resp.status_code}
     Should Be Equal    ${Status_code}  200

Populating the Database from UI
        Open Browser     http://localhost:8080/  chrome
        Maximize Browser Window
        Element Text Should Be   //span[@class="input-group-text"]     Upload CSV file
        Click Element    xpath://button[text()="Refresh Tax Relief Table"]
        ${rows}=    get element count   xpath://table[@class="table table-hover table-dark"]/tbody/tr
        Log To Console    ${rows}
        FOR    ${i}    IN RANGE    1    ${rows}    1
        ${ui_data}=     Get text    xpath://table[@class="table table-hover table-dark"]/tbody/tr[${i}]
        Log To Console   ${ui_data}
        END
        Close All Browsers



