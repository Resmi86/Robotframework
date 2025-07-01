*** Settings ***
Library     SeleniumLibrary



*** Variables ***
${url}     https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}  Chrome





*** Keywords ***
Launch application
    open browser        ${url}     ${browser}
    Maximize Browser Window
    Sleep     5s

Enter credentials
     input text    username      Admin
     input password    password    admin123

clicksumbit
     click button     //button[@type='submit']

Verify dashboardappears

    wait until location is    https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index     timeout= 5s

   wait until page contains element    //h6[text()="Dashboard"]      timeout= 5s