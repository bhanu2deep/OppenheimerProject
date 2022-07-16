*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}  http://localhost:8080

*** Test Cases ***
Insert_singleRecord
   Create Session    mysession    ${base_url}
   ${body}=   Create Dictionary  birthday=12021983  gender=F  name=Bhanu  natid=india  salary=20210  tax=15
     #${body}=   Create Dictionary  birthday=string gender=string name=string natid=string salary=string tax=string
  ${header}=  Create Dictionary  Content-Type=application/json
  ${response}=  Post Request  mysession  calculator/insert  data=${body}  headers=${header}
   Log To Console    ${response.status_code}
   # Log To Console    ${response_content}
  
  #Validations
  
  ${Status_code}=  Convert To String   ${response.status_code}
  Should Be Equal    ${Status_code}  202
  # ${res_body}=  Convert To String    ${response_content}
   #Should Contain    ${res_body}    OK

