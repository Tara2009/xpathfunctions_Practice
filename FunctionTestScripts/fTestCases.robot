# before running this suite.

*** Settings ***
Resource          ../FunctionResources/fcommon.robot
Suite Setup       Setup Browser
Suite Teardown    End suite


*** Test Cases ***
Open wordpress website
    [Tags]        commitment
    Appstate      Home
    #${headertext}=    GetText    //h1[@class\='wp-block-heading has-text-align-center has-x-large-font-size']
    #${headertext1}=   GetText    //h1[@class\='wp-block-heading has-text-align-center has-x-large-font-size1']
    #${headertext}=    IsElement    //h1[@class\='wp-block-heading has-text-align-center has-x-large-font-size']
    #${headertext1}=   IsElement    //h1[@class\='wp-block-heading has-text-align-center has-x-large-font-size1']
    
    # Verifying component is available in the page or not, if available return True or if not available return false
    ${headertext}=      IsElement    //h1[@class\='post-title entry-title']
    ${headertext1}=      IsElement    //h1[@class\='post-title entry-title1']
    ${WText}=           GetText    //a[text()='Sign in']
    Log               ${headertext}
    Log               ${headertext1}
    Log               ${WText}
    
    Run Keyword If    '${headertext}'=='True'    Test Keyword 1
    ...               ELSE                        Test keyword 2
    Sleep             10s

*** Keywords ***
Test Keyword 1
    Log To Console    Executed Keyword 1 - Component 1 is Enable
    Log               Log Executed 1 - Component 1 is Enable
Test Keyword 2
    Log To Console    Executed Keyword 2 - Component 2 is Enable
    Log               Log Executed 2 - Component 2 is Enable
