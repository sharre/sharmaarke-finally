*** Settings ***
Library    Browser    timeout=30s

*** Variables ***
${URL}=    https://eficode.com/contact


*** Test Cases ***
Stockholm office is visible in Sweden contact info
    New Page    ${URL}
    Click    xpath=//li[@data-filter="sweden"]
    
    Verify that Stockholm office contact information is visible

Robot Framework fundamentals training is one day
    New Page    ${URL}
    Click    css=.cd-search-trigger
    Take Screenshot
    Fill Text    //*[contains(@class, "hs-search-field__input")]    robot framework
    Press Keys    //*[contains(@class, "hs-search-field__input")]    Enter
    click    text=Robot Framework fundamentals training | Eficode
    Take Screenshot
    Get Element States    xpath=//*[text()="Duration:"]/following-sibling::*/*[text()="One day"]
    Take Screenshot

    #Verify duration is one day
*** Keywords ***
Verify that Stockholm office contact information is visible
    Get Element States    xpath=//*[@class="card-title" and text()="Stockholm"]
    
    #Select Sweden from the countries filter
    #Click    selector
## optional
# Helsinki office is not visible in Sweden contact info
