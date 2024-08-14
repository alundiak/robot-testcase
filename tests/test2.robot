*** Settings ***
Library    BuiltIn
Library    ../Libraries/generate_random_number.py
Resource    ../Keywords/Generate_Random_Number.robot
Resource    ../Keywords/Generate_Random_Character.robot


*** Test Cases ***
Testing Random Things
    [Documentation]    This test case verifies random things
    [Tags]    testing_random

    ${random_number1}=
    ...    Generate Random Number A
    ...    1
    ...    10
    Log    ${random_number1}
    ${is_number1}=    Evaluate    isinstance(${random_number1}, int)
    Should Be True    ${is_number1}    The value is not an instance of int.

    ${random_number2}=
    ...    Generate Random Number B
    ...    50
    ...    100
    Log    ${random_number1}
    ${is_number2}=    Evaluate    isinstance(${random_number2}, int)
    Should Be True    ${is_number2}    The value is not an instance of int.

    ${random_char}=
    ...    Generate Random Character
    Log    ${random_char}
    # casting doesn't work, char A is still passed as kinda variable name
    # ${string_element}=    Evaluate    str(${random_char})
    ${is_string}=    Evaluate    isinstance('${random_char}', str)
    Should Be True    ${is_string}    The value is not an instance of str.
