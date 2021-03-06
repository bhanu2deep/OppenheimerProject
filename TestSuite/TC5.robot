*** Settings ***
Library     SeleniumLibrary
Library      OperatingSystem
#Library    XML
#Suite Setup     Open my Browser
#Suite Teardown       Close Browsers
#Test Template       Button Validation

*** Variables ***
${Button}  Dispense Now

*** Test Cases ***
Button validation
   Open Browser     http://localhost:8080/  chrome
   Maximize Browser Window
Validating the Button Color

    ${BG}=  Get WebElement   xpath=(//a[@class="btn btn-danger btn-block"])
    ${bg color}=    Call Method    ${BG}  value_of_css_property     ('background-color')
     Log To Console    ${bg color}
 Validate the Button Text
      Element Text Should Be   //a[@class="btn btn-danger btn-block"]     Dispense Now
 Click Dispense Now Button
       Click Element    xpath://a[@href="dispense"]
 Cash Dispensed Page should be visible
      page should contain     Cash dispensed
 Close Browsers
   Close All Browsers