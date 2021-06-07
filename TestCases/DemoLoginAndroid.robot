*** Settings ***
Library    AppiumLibrary

*** Variables ***
${email}        vankhanhsb@gmail.com
${pass}         12345678

${register_id}     com.loginmodule.learning:id/textViewLinkRegister
${register_name_id}         com.loginmodule.learning:id/textInputEditTextName
${register_email_id}            com.loginmodule.learning:id/textInputEditTextEmail
${register_password_id}          com.loginmodule.learning:id/textInputEditTextPassword
${register_confirm_pw_id}         com.loginmodule.learning:id/textInputEditTextConfirmPassword
${register_button_id}       com.loginmodule.learning:id/appCompatButtonRegister
${register_ok_message_id}       com.loginmodule.learning:id/snackbar_text

${login_email_id}       com.loginmodule.learning:id/textInputEditTextEmail
${login_pw_id}          com.loginmodule.learning:id/textInputEditTextPassword
${login_button_id}      com.loginmodule.learning:id/appCompatButtonLogin
${login_success}        com.loginmodule.learning:id/textViewName
*** Test Cases ***
OpenApp
    open application   http://localhost:4723/wd/hub     platformName=ANDROID   platformVersion=9
    ...     deviceName=emulator-5554    appPackage=com.loginmodule.learning
    ...     appActivity=com.loginmodule.learning.activities.LoginActivity      automationName=UIAutomator2
Register
    click element       ${register_id}
    wait until page contains element        ${register_name_id}
    input text       ${register_name_id}         Phong
    input text       ${register_email_id}         ${email}
    InputAndConfirmPassword     ${pass}
    click element       ${register_button_id}
    wait until element is visible       ${register_ok_message_id}
    page should contain element     ${register_ok_message_id}
    go back
LoginSuccess
    InputEmailLogin     ${email}
    InputPWLogin        ${pass}
    click element       ${login_button_id}
    wait until element is visible       ${login_success}
    page should contain element         ${login_success}
    go back
LoginFail
    InputEmailLogin     a
    InputPWLogin        1
    click element       ${login_button_id}
    wait until page contains    Enter Valid Email
    page should contain text    Enter Valid Email
    go back
*** Keywords ***
InputAndConfirmPassword
    [Arguments]     ${password}
    input password      ${register_password_id}         ${password}
    input password      ${register_confirm_pw_id}       ${password}
InputEmailLogin
    [Arguments]     ${email}
    input text      ${login_email_id}       ${email}
InputPWLogin
    [Arguments]     ${pw}
    input text      ${login_pw_id}       ${pw}