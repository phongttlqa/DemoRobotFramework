*** Settings ***
Library     AppiumLibrary
*** Variables ***
${id_number_2}      id=com.google.android.calculator:id/digit_2
${id_number_9}      id=com.google.android.calculator:id/digit_9
${id_eq}      id=com.google.android.calculator:id/eq
${id_mul}      id=com.google.android.calculator:id/op_mul
${id_add}      id=com.google.android.calculator:id/op_add
${id_result}      id=com.google.android.calculator:id/result


*** Test Cases ***
OpenApp
    open application   http://localhost:4723/wd/hub     platformName=ANDROID   platformVersion=9
    ...     deviceName=emulator-5554    appPackage=com.google.android.calculator
    ...     appActivity=com.android.calculator2.Calculator       automationName=UIAutomator2
    wait until page contains element       ${id_number_2}     timeout=10   error=false
    addtestcase
    clear text    ${id_result}
    multestcase
*** Keywords ***
MulTestCase
    click element     ${id_number_2}
    click element     ${id_mul}
    click element     ${id_number_9}
    click element     ${id_eq}
    page should contain text    18

AddTestCase
    click element     ${id_number_2}
    click element     ${id_add}
    click element     ${id_number_9}
    click element     ${id_eq}
    page should contain text    10