# before running this suite.

*** Settings ***
Resource                   ../FunctionResources/fcommon.robot
Suite Setup                Setup Browser
Suite Teardown             End suite


*** Test Cases ***
Open wordpress website
    [Tags]                 commitment
    Appstate               Home
    #${headertext}=        GetText                     //h1[@class\='wp-block-heading has-text-align-center has-x-large-font-size']
    #${headertext1}=       GetText                     //h1[@class\='wp-block-heading has-text-align-center has-x-large-font-size1']
    #${headertext}=        IsElement                   //h1[@class\='wp-block-heading has-text-align-center has-x-large-font-size']
    #${headertext1}=       IsElement                   //h1[@class\='wp-block-heading has-text-align-center has-x-large-font-size1']

    # Verifying component is available in the page or not, if available return True or if not available return false
    ${headertext}=         IsElement                   //h1[@class\='post-title entry-title']
    ${headertext1}=        IsElement                   //h1[@class\='post-title entry-title1']
    ${WText}=              GetText                     //a[text()\='Sign in']
    ${scontain}=           GetText                     //a[contains(text(),'account')]
    ${sstartwith}=         GetText                     //a[starts-with(text(),'Sign in into')]
    ${snormlize}=          GetText                     //label[normalize-space(text())\='First Name']          # Remove front and back spaces
    ${slast}=              GetText                     (//table[@id\='contactList']/tbody/tr)[last()]          # Return last row of the table
    ${lpostion}=           GetText                     (//table[@id\='contactList']/tbody/tr)[position()\=2]    #It works same as index with different condition
    # TypeText             //label[text()\='Email']/following-sibling::input[@type\='text']                    tarasrinivas@gmail.com
    ${lfolsibling_par}=    GetText                     //label[text()\='Email']/following-sibling::input[@type\='text']    #Here 'Email' is the parent tag element and following sibling is the input tag (Here input is the tag)
    ${lprecesib}=          GetText                     //td[text()\='Germany']/preceding-sibling::td/child::input
    ${lchildt}=            GetText                     //table[@id\='contactList']/child::tbody/child::tr/child::td[4]
    ${lparent}=            GetText                     //td[text()\='Helen Bennett']/parent::tr
    ${lancest}=            GetText                     //td[text()\='Helen Bennett']/ancestor::div                      # Return all div values in the form (i.e. Parent and grand Parent)
    Log                    ${headertext}
    Log                    ${headertext1}
    Log                    ${WText}
    Log                    ${scontain}
    Log                    ${sstartwith}
    Log                    ${snormlize}
    Log                    ${slast}
    Log                    ${lpostion}
    Log                    ${lfolsibling_par}
    Log                    ${lprecesib}
    Log                    ${lchildt}
    Log                    ${lparent}
    Log                    ${lancest}

    Run Keyword If         '${headertext}'=='True'     Test Keyword 1
    ...                    ELSE                        Test keyword 2
    Sleep                  10s

*** Keywords ***
Test Keyword 1
    Log To Console         Executed Keyword 1 - Component 1 is Enable
    Log                    Log Executed 1 - Component 1 is Enable
Test Keyword 2
    Log To Console         Executed Keyword 2 - Component 2 is Enable
    Log                    Log Executed 2 - Component 2 is Enable
