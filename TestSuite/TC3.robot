*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library    OperatingSystem

*** Variables ***
${base_url}  http://localhost:8080

*** Test Cases ***
Insert_singleRecord
   Create Session    mysession    ${base_url}
   ${file1}=  Get Binary File  ${CURDIR}/Datafile.csv
#   ${files}=  CREATE DICTIONARY    form-data ${file1}
   ${header}=  Create DICTIONARY  Content-Type=multipart/form-data; boundary=1
   ${response}=    POST On Session  mysession   /calculator/uploadLargeFileForInsertionToDatabase file=&{file1} headers=&{header}
   Log To Console    ${response.status_code}

  #Validations

  ${Status_code}=  Convert To String   ${response.status_code}
  Should Be Equal    ${Status_code}  200
  # ${res_body}=  Convert To String    ${response_content}
   #Should Contain    ${res_body}    OK