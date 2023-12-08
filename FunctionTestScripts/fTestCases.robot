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
    ${lancest}=            GetText                     //td[text()\='Helen Bennett']/ancestor::div             # Return all div values in the form (i.e. Parent and grand Parent)
    ${ldesc}=              GetText                     //table[@id\='contactList']/descendant::*               # Return child and grand child
    ${lparefoll}=          GetText                     //label[text()\='Password']/parent::div/following-sibling::div[1]/child::input
    ${lfollwing}=          GetText                     //label[text()\='Password']/following::input[1]         # if we remove [1] return multiple components, here give index (i.e. [1] return single components)
    ${lfollmul}=           GetText                     //label[text()\='Password']/following::input            # if we remove [1] return multiple components, here give index (i.e. [1] return single components)
    ${lprec}=              GetText                     //label[text()\='Password']/preceding::input[1]         # if we remove [1] return multiple components, here give index (i.e. [1] return single components)
    ${lprecemul}=          GetText                     //label[text()\='Password']/preceding::input            # This is opposite to Following, if we remove [1] return multiple components, here give index (i.e. [1] return single components)
    # Xpath Shortcuts or Abbreviations
   ${ltexsho}=             GetText                     //h1[.\='Register']                    # Actually syntax is //h1[.\='Register'] we can use dot instead of text to find text in the website
   ${ltexcont}=            GetText                     //a[contains(.,'account')]             # Actually //a[contains(text(),'account')] we can use dot instead of text to find text in the website
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
    Log                    ${ldesc}
    Log                    ${lparefoll}
    Log                    ${lfollwing}
    Log                    ${lfollmul}
    Log                    ${lprec}
    Log                    ${lprecemul}
    Log                    ${ltexsho}

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
