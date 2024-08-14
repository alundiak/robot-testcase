*** Keywords ***
Generate Random Number
    [Arguments]    ${min}=0    ${max}=100

    ${random_number}=    
    ...    Evaluate    
    ...    random.randint(${min}, ${max})

    RETURN    ${random_number}
