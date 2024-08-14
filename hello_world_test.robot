*** Settings ***
Documentation     A simple Hello World test
Library            OperatingSystem

*** Test Cases ***
Hello World Test
    [Documentation]    This test case prints Hello World
    [Tags]    example
    Log    Hello World
