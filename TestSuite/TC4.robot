*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library    String

*** Variables ***
${base_url}  http://localhost:8080
${Age}    75
${Sex}    M
${Salary}  23523
${tax_Paid}  100
${Inner_calculation} =    ${${Salary}-${tax_Paid}}


*** Test Cases ***
Retrieving the List - AC1
  Create Session    mysession    ${base_url}
  ${response}=  GET On Session  mysession  calculator/taxRelief
 #Validations
  ${Status_code}=  Convert To String   ${response.status_code}
  Should Be Equal    ${Status_code}  200

#Validating the $sign in 5th Character - AC2

    ${rows}=    Get Count    ${response.json()}\[]  natid
    Log To Console    ${rows}

        ${title}=  Get Value From Json      ${response.json()}[0]  natid
    ${titleFromList}=  Get From List   ${title}  ${0}
    @{cutFirstLetter}=  Split String To Characters  ${titleFromList}[4]
    Log To Console  ${titleFromList}
    Log To Console  ${cutFirstLetter}
    Should Contain    @{cutFirstLetter}    $

#Tax Relief Calculation - AC3
  IF  ${Age} <= 18
      ${i}  Set Variable  1
  ELSE IF    18 <= ${Age} <= 35
      ${i}  Set Variable  0.8
  ELSE IF    35 <= ${Age} <= 50
      ${i}  Set Variable  0.5
  ELSE IF    50 <= ${Age} <= 75
      ${i}  Set Variable  0.367
  ELSE IF    ${Age} > 75
      ${i}  Set Variable  0.05
  END
    Log To Console    ${i}

   IF  "${Sex}" == "M"
      ${j}  Set Variable  0
    ELSE IF  "${Sex}" == "F"
      ${j}  Set Variable  500
  END
    Log To Console    ${j}

    ${Pre_Tax} =    Evaluate    ${Inner_calculation}*${i}
    Log To Console    ${Pre_Tax}
    ${Tax_Relief1} =    Evaluate    ${Pre_Tax}+${j}
    Log To Console    ${Tax_Relief1}

  #Tax Relief Rounding - AC4 and AC6

   ${Final_Tax_Relief2} =    Evaluate   round(${Tax_Relief1},2)
    Log To Console    ${Final_Tax_Relief2}

#  ${Final_Tax_Relief} =    Evaluate   math.ceil(${Tax_Relief1})
   ${Final_Tax_Relief} =    Evaluate   int(${Tax_Relief1})
    Log To Console    ${Final_Tax_Relief}

  #Tax Relief Rounding - AC5


  IF   0 <= ${Final_Tax_Relief} <= 50
      ${k}  Set Variable  50
  ELSE
      ${k}  Set Variable  ${Final_Tax_Relief}
      Log To Console    ${k}
  END



