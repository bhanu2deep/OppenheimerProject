#*** Settings ***
#Library     SeleniumLibrary
#Library      OperatingSystem
#
#
#*** Variables ***
#${Login URL}    http://localhost:8080/
#${Browser}   Chrome
#
#*** Keywords ***
#Open my Browser
#
#     Open Browser    ${Login URL}  {Browser}
#     Maximize Browser Window
#
#Close Browsers
#   Close All Browsers
#
# Open Login Page
#     Go To    ${Login URL}
#
# Validating the Button Color
#
# # Get element using Xpath in JavaScript.
#     ${element}=    Set Variable    document.evaluate("${//a[@class="btn btn-danger btn-block"]}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
#
## Get css attribute value using getComputedStyle()
#    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('${css_attribute}');
#
#Log   ${attribute_value}
##
##      ${LOCATOR}     //a[@class="btn btn-danger btn-block"]
##     ${SELECTEDGREEN}=        ${LOCATOR}
#
##     ${bgcolor}    Execute Javascript    return document.defaultView.getComputedStyle(document.getElementByXpath("//a[@class="btn btn-danger btn-block"]")['background-color'])
##     Log To Console    ${bgcolor}
#
# Validate the Button Text
#    Element Text Should Match   Dispense Now
#
## click Dispense Now Button
##    Click Element    xpath://a[@href="dispense"]
#
## Cash Dispensed Page should be visible
##    page should contain     Cash dispensed




