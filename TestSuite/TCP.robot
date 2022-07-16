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
#   ${fileData}=  Get File   C:\\Users\\PRADEEP\\PycharmProjects\\TestProject\\TestSuite\\DataFile.csv
   ${file}=    GET FILE   ${CURDIR}/DataFile.csv
   ${file}=    c
   ${files}=    CREATE DICTIONARY    file    ${file}
   ${Header}=  Create DICTIONARY  Content-Type=multipart/form-data; boundary=1
   ${response}=    POST On Session  mysession  /calculator/uploadLargeFileForInsertionToDatabase  file=${files}  headers=${Header}


#   &{fileParts}=  Create Dictionary
#   Set To Dictionary    ${fileParts}  file=${fileData}
#   ${data}=  Create Dictionary “file”: (${fileData} ,${fileParts}, content-type=multipart/form-data boundary)
#   ${header}=  create dictionary  Content-Type=multipart/form-data boundary accept=application/json

#   ${files}=  CREATE DICTIONARY    form-data ${fileData}
#   ${header}=  Create DICTIONARY  Content-Type=multipart/form-data boundary
#   ${response}=    POST On Session  mysession  url=/calculator/uploadLargeFileForInsertionToDatabase  files=${data}  headers=${header}
   Log To Console    ${response.status_code}

  #Validations

  ${Status_code}=  Convert To String   ${response.status_code}
  Should Be Equal    ${Status_code}  200
  # ${res_body}=  Convert To String    ${response_content}
   #Should Contain    ${res_body}    OK