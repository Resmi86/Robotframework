*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/loginui.robot
Test Setup      close all browsers






*** Variables ***
${url}     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}    Chrome





*** Test Cases ***
Logintest
    [Tags]    Smoke
      Launch application
      Enter credentials
      clicksumbit

Verify dashboard
    [Tags]    Sanity
    Launch application
    Enter credentials
    clicksumbit
    Verify dashboardappears
