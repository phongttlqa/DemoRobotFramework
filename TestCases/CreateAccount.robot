*** Settings ***
Library  Selenium2Library
*** Variables ***
${linkweb}  http://automationpractice.com/index.php
${browser}  chrome

${signInLocator}  //*[@class=\"header_user_info\"]
${inputEmailLoc}  id:email_create
${createAccButtonLoc}   //*[@id=\"SubmitCreate\"]
${createAccTextLoc}  //*[text()=\"Create an account\"]
${errorEmailTextLoc}  //*[@id=\"create_account_error\"]
${personalInfoLoc}  //*[text()=\"Your personal information\"]
${genderButtonLoc}  //*[@id=\"id_gender1\"]
${firstNameInputLoc}  id:customer_firstname
${lastNameInputLoc}  //*[@id=\"customer_lastname\"]
${passwordInputLoc}  //*[@id=\"passwd\"]
${frtnameAddressInputLoc}  //*[@id=\"firstname\"]
${lstnameAddressInputLoc}  //*[@id=\"lastname\"]
${addressInputLoc}  //*[@id=\"address1\"]
${cityInputLoc}  //*[@id=\"city\"]
${stateSelectLoc}  //*[@id=\"id_state\"]
${zipCodeInputLoc}  //*[@id=\"postcode\"]
${countryInputLoc}  //*[@id=\"id_country\"]
${mobileInputLoc}  //*[@id=\"phone_mobile\"]
${assignAddressInputLoc}  //*[@id=\"alias\"]
${registerButtonLoc}  //*[@id=\"submitAccount\"]
${createAccSuccessTextLoc}  //*[@class=\"info-account\"]

${containsTextPage}  Create an account
${emailFakeError}  abc
${emailFake}  phuthanhphat2@ymail.com
${containsTextCreateAccountFail}  Invalid email address.
*** Test Cases ***
CreateAccountFail
    openwebsite
    gotocreateaccountpage
    enteremail  ${emailFakeError}
    click button  ${createAccButtonLoc}
    wait until element is visible   ${errorEmailTextLoc}    timeout=10   error=false
    #wait until page contains  ${containsTextCreateAccountFail}
    #element should be enabled  ${errorEmailTextLoc}
    close browser


CreateAccountSuccess
    openwebsite
    gotocreateaccountpage
    input text  ${inputEmailLoc}   ${emailfake}
    click button  ${createAccButtonLoc}
    #wait until page contains  YOUR PERSONAL INFORMATION  timeout=10   error=false
    wait until element is visible  ${genderbuttonloc}   timeout=10   error=false
    #click button  ${genderButtonLoc}
    select radio button   id_gender   1
    input text   ${firstnameinputloc}   T
    input text   ${lastnameinputloc}   T
    input text  ${passwordinputloc}   T12345678
    input text  ${frtnameaddressinputloc}   T
    input text  ${lstnameaddressinputloc}   T
    input text   ${addressinputloc}   T
    input text  ${cityinputloc}   T
    select from list by index  ${stateselectloc}   1
    input text   ${zipcodeinputloc}   10001
    input text   ${mobileinputloc}   1232131232
    input text  ${assignaddressinputloc}    phuthanhphat11@ymail.com
    click button  ${registerbuttonloc}
    wait until element is enabled  ${createaccsuccesstextloc}  timeout=10   error=false
    #Should Be Equal    ${MESSAGE}    Hello, world!
    close browser

*** Keywords ***
OpenWebsite
    open browser  ${linkweb}   ${browser}
    #maximize browser window
    ${title} =   get title
    log to console  AAAAAAAAAAAAA ${title}
    Title Should Be    My Store
GotoCreateAccountPage
    click element  ${signInLocator}
    wait until page contains   ${containsTextPage}  timeout=10   error=false
EnterEmail
    [Arguments]   ${email}
    input text   ${inputemailloc}   ${email}