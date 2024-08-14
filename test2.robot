*** Settings ***
Library    BuiltIn
# Library    ./Libraries/generate_random_number.py
Resource    ./Keywords/Generate_Random_Number.robot

*** Test Cases ***
Example Test Case
    ${random_number}=    
    ...    Generate Random Number    
    ...    1    
    ...    10
    
    Log    ${random_number}
