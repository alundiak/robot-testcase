*** Keywords ***
Generate Random Character
    ${chars}=
    ...    Evaluate
    ...    [chr(c) for c in range(ord('A'), ord('Z') + 1)]

    ${random_char}=
    ...    Evaluate
    ...    random.choice(${chars})

    RETURN    ${random_char}
