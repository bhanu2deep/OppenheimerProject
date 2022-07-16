*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}    http://localhost:8080

*** Test Cases ***
Insert_MultipleRecord
     Create Session  mysession  ${base_url}
     ${obj2}=    Create Dictionary    birthday=12022010  gender=F  name=Sreesha  natid=India  salary=500  tax=10
     ${body}=  Create List  ${obj2}
     ${header}=  Create Dictionary  Content-Type=application/json
     ${response}=  Post Request  mysession  calculator/insertMultiple  data=${body}  headers=${header}
     Log To Console    ${response.status_code}
   # Log To Console    ${response_content}

  #Validations

  ${Status_code}=  Convert To String   ${response.status_code}
  Should Be Equal    ${Status_code}  202
  # ${res_body}=  Convert To String    ${response_content}
   #Should Contain    ${res_body}    OK

