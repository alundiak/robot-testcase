*** Keywords ***
Generate Random Number B
    [Arguments]    ${min_value}=0    ${max_value}=100

    ${random_number}=
    ...    Evaluate
    ...    random.randint(${min_value}, ${max_value})

    RETURN    ${random_number}
