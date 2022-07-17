*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library    OperatingSystem

*** Variables ***
${base_url}  http://localhost:8080

*** Test Cases ***
Insert_singleRecord
    Create Session   mysession    ${base_url}
    ${file_data}  Get File For Streaming Upload  ${CURDIR}${/}Datafile.csv
    ${files}=  Create Dictionary  file  ${file_data}
    ${header}=  create dictionary     Content-Type=multipart/form-data;boundary=100
    ${response}=    POST On Session   mysession   calculator/uploadLargeFileForInsertionToDatabase   data=${files}  headers=${header}
    Log To Console    ${response.status_code}
    #to validate status code with the actual status code
     ${Status_code}=  Convert To String   ${response.status_code}
     Should Be Equal    ${Status_code}  200
