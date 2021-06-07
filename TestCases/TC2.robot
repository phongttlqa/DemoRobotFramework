*** Settings ***
Library  Selenium2Library
*** Test Cases ***
OpenWebsite
    open browser  https://robotframework.org/     chrome
    maximize browser window
    click element  //*[@id="navigation"]/li[3]
    #close browser